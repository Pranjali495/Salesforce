public with sharing class PriceCalculator
{
    private static List<BasePriceTable__c> basePriceSettings;
    private static Map<String, ProductPriceTable__c> productPriceMap;


    public static void calculatePrice(Opportunity opp, List<OpportunityLineItem> lineItems)
    {
        for(OpportunityLineItem lineItem : lineItems)
        {
            lineItem.List_Price__c = calculateListPrice(opp, lineItem);
            if(lineItem.UnitPrice == null)
            {
                lineItem.UnitPrice = lineItem.List_Price__c;
            }
            /*
            if(lineItem.Discount__c == null)
            {
                lineItem.Discount__c = 0.00;
            }
            lineItem.UnitPrice = calculateUnitPrice(lineItem);
            */
            lineItem.Discount__c = calculateDiscount(lineItem);
        }
    } 

    private static Decimal calculateListPrice(Opportunity opp, OpportunityLineItem lineItem)
    {
        if(lineItem.PricebookEntry.Product2.UseStandardPrice__c)
        {
            return lineItem.Hours_Info_Only__c == null ? 0.00 : lineItem.PricebookEntry.UnitPrice * lineItem.Hours_Info_Only__c;
        }
        if(lineItem.PricebookEntry.Product2.Family == 'Services')
        {
            return getServiceProductPrice(opp, lineItem);
        }       
        if(lineItem.PricebookEntry.Product2.Family == 'Integration')
        {
            return getIntegrationProductPrice(opp, lineItem);
        } 
        if(lineItem.PricebookEntry.Product2.Family == 'License')
        {
            return getLicenseProductPrice(opp, lineItem);
        }
        return 0.00;
    }

    private static Decimal getServiceProductPrice(Opportunity opp, OpportunityLineItem lineItem)
    {        
        Decimal hours = lineItem.Hours_Info_Only__c;
        Decimal rates = lineItem.PricebookEntry.Product2.Integration_Rate__c;
        if(hours == null || hours == 0)
        {
            return 0.00;
        }
        if(rates == null || rates == 0)
        {
            return 0.00;
        }          
        Decimal price = rates * hours;
        return (CurrencyConversion.convertToLocalCurrency(price, opp.CurrencyIsoCode)).setScale(2);
    }

    private static Decimal getIntegrationProductPrice(Opportunity opp, OpportunityLineItem lineItem)
    {
        Decimal hours = lineItem.Hours_Info_Only__c;
        Decimal rates = lineItem.PricebookEntry.Product2.Integration_Rate__c;
        if(hours == null || hours == 0)
        {
            return 0.00;
        }
        if(rates == null || rates == 0)
        {
            return 0.00;
        }

        
        // Based on Julie's response on 10/18/2016, the NumberofSites should not be included in the pricing calculation.
        /*
        if(opp.NumberOfSites__c == null || opp.NumberOfSites__c == 0)
        {
            return 0.00;
        }   
        Decimal price = rates * hours + rates * hours * (opp.NumberOfSites__c - 1) * 0.8;
        return (CurrencyConversion.convertToLocalCurrency(price, opp.CurrencyIsoCode)).setScale(2);  
        */ 

        Decimal price = rates * hours;
        return (CurrencyConversion.convertToLocalCurrency(price, opp.CurrencyIsoCode)).setScale(2);

             
    }

    private static Decimal getLicenseProductPrice(Opportunity opp, OpportunityLineItem lineItem)
    {
        if(productPriceMap == null)
        {
            initProductPriceMap();
        }
        String key = null;        
        if(productPriceMap.containsKey(lineItem.PricebookEntry.Product2.ProductSubFamily__c))
        {
            key = lineItem.PricebookEntry.Product2.ProductSubFamily__c;
        }
        else if(productPriceMap.containsKey(lineItem.PricebookEntry.Product2.Product_Sub_Category__c))
        {
            key = lineItem.PricebookEntry.Product2.Product_Sub_Category__c;
        }

        if(key != null)
        {
            Decimal basePricePercent = productPriceMap.get(key).PercentOfBase__c;
            Decimal bundleDiscount = productPriceMap.get(key).BundleDiscount__c; 
            if(basePricePercent == null)
            {
                basePricePercent = 1;
            }
            if(bundleDiscount == null)
            {
                bundleDiscount = 1;
            }
            Decimal price = getBasePrice(opp) * basePricePercent * bundleDiscount;
            return (CurrencyConversion.convertToLocalCurrency(price, opp.CurrencyIsoCode)).setScale(2);
        }
        return 0.00;
    }

    private static void initProductPriceMap()
    {
        productPriceMap = new Map<String, ProductPriceTable__c>();
        List<ProductPriceTable__c> productPriceSettings = ProductPriceTable__c.getAll().values();
        for(ProductPriceTable__c productPrice : productPriceSettings)
        {
            productPriceMap.put(productPrice.ProductFamily__c, productPrice);
        }
    }

    private static Decimal getBasePrice(Opportunity opp)
    {        
        Decimal totalRevenue = CurrencyConversion.convertToCorpCurrency(opp.Total_Addressable_Revenue__c, opp.CurrencyIsoCode);
        if(totalRevenue == null)
        {
            totalRevenue = 0;
        }

        Decimal basePrice = 0.00;
        if(basePriceSettings == null)
        {
            initBasePriceSettings();
        }
        for(BasePriceTable__c setting : basePriceSettings)
        {
            if((totalRevenue >= setting.TierPriceStart__c || setting.TierPriceStart__c == null)
            && (totalRevenue <= setting.TierPriceEnd__c || setting.TierPriceEnd__c == null))
            {
                if(setting.TierCostPercent__c == null)
                {
                    basePrice = totalRevenue;
                }
                else
                {
                    basePrice = totalRevenue * setting.TierCostPercent__c;
                }   
                if(setting.PriceCap__c == null || setting.PriceCap__c > basePrice)
                {
                    return basePrice;
                }             
                else
                {
                    return setting.PriceCap__c;
                }
            }
        }
        return basePrice;
    }

    private static void initBasePriceSettings()
    {
        Map<String, BasePriceTable__c> basePriceMap = BasePriceTable__c.getAll();
        basePriceSettings = basePriceMap.values();
    }
    /*
    private static Decimal calculateUnitPrice(OpportunityLineItem lineItem)
    {        
        if(lineItem.Discount__c == 100)
        {
            return 0;
        }
        return (lineItem.List_Price__c * (1 - lineItem.Discount__c / 100)).setScale(2);
    }
    */
    private static Decimal calculateDiscount(OpportunityLineItem lineItem)
    {        
        if(lineItem.List_Price__c == 0)
        {
            return 0;
        }
        return (100 * (1 - lineItem.UnitPrice / lineItem.List_Price__c)).setScale(2);
    }
}