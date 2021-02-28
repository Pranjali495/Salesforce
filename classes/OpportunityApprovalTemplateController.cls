public with sharing class OpportunityApprovalTemplateController
{
    public String TargetObjectId { get; set; }

    public ProcessInstanceWorkitem WorkItem
    {
        get
        {
            if(TargetObjectId != null)
            {
                List<ProcessInstanceWorkitem> workItems = [select Id, Actor.Name, CreatedBy.Name from ProcessInstanceWorkitem where ProcessInstance.TargetObjectId = :TargetObjectId];
                if(workItems.size() > 0)
                {
                    return workItems[0];
                }
                else
                {
                    return null;
                }
            }            
            else
            {
                return null;
            }
        }        
    }

    public OpportunityWrapper getWrapper()
    {
        if(TargetObjectId != null)
        {
            Opportunity opp = [select Id, Name, Account.Name, Total_Addressable_Revenue__c, Amount, 
                                      New_ACV_Amount__c, CloseDate, CurrencyIsoCode, NumberOfSites__c,
                                      Services_and_Integration_Total__c, Discount__c,
                                      Roll_Up_Indiv_License_List__c, Roll_up_of_Contract_Sales_Price__c,
                                      Total_Discount_on_Licenses__c, Total_Services_List_Price__c,
                                      Total_Services_Contract_Sales_Price__c, Total_Discount_on_Services__c,
                                    (select PricebookEntry.Product2.Name, List_Price__c, 
                                            Discount__c, UnitPrice, POC_Terms__c 
                                    from OpportunityLineItems)
                                from Opportunity where Id = :TargetObjectId];

            OpportunityWrapper result = new OpportunityWrapper();
            result.Opportunity = opp;


            result.CompoundAmount = convertToString(opp.Amount, opp.CurrencyIsoCode);
            result.CompoundTotalRevenue = convertToString(opp.Total_Addressable_Revenue__c, opp.CurrencyIsoCode);
            result.CompoundACVAmount = convertToString(opp.New_ACV_Amount__c, opp.CurrencyIsoCode);
            result.CompoundSITotal = convertToString(opp.Services_and_Integration_Total__c, opp.CurrencyIsoCode);
            
            result.CompoundTotalListPrice = convertToString(opp.Roll_Up_Indiv_License_List__c, opp.CurrencyIsoCode);
            result.CompoundTotalSalesPrice = convertToString(opp.Roll_up_of_Contract_Sales_Price__c, opp.CurrencyIsoCode);
            result.CompoundTotalServiceListPrice = convertToString(opp.Total_Services_List_Price__c, opp.CurrencyIsoCode);
            result.CompoundTotalServiceSalesPrice = convertToString(opp.Total_Services_Contract_Sales_Price__c, opp.CurrencyIsoCode);                  

            result.OpportunityProducts = new List<OpportunityProductWrapper>();
            for(OpportunityLineItem lineItem : opp.OpportunityLineItems)
            {
                OpportunityProductWrapper oppProduct = new OpportunityProductWrapper();
                oppProduct.LineItem = lineItem;
                oppProduct.CompoundListPrice = convertToString(lineItem.List_Price__c, opp.CurrencyIsoCode);
                oppProduct.CompoundUnitPrice = convertToString(lineItem.UnitPrice, opp.CurrencyIsoCode);
                result.OpportunityProducts.add(oppProduct);
            }

            if(opp.CurrencyIsoCode != 'USD')
            {
                Decimal conversionRate = getConversionRate(opp.CurrencyIsoCode);
                result.CompoundAmount += getConvertedValue(opp.Amount, conversionRate);
                result.CompoundTotalRevenue += getConvertedValue(opp.Total_Addressable_Revenue__c, conversionRate);
                result.CompoundACVAmount += getConvertedValue(opp.New_ACV_Amount__c, conversionRate);
                result.CompoundSITotal += getConvertedValue(opp.Services_and_Integration_Total__c, conversionRate);

                result.CompoundTotalListPrice += getConvertedValue(opp.Roll_Up_Indiv_License_List__c, conversionRate);
                result.CompoundTotalSalesPrice += getConvertedValue(opp.Roll_up_of_Contract_Sales_Price__c, conversionRate);
                result.CompoundTotalServiceListPrice += getConvertedValue(opp.Total_Services_List_Price__c, conversionRate);
                result.CompoundTotalServiceSalesPrice += getConvertedValue(opp.Total_Services_Contract_Sales_Price__c, conversionRate);

                for(OpportunityProductWrapper oppProduct : result.OpportunityProducts)
                {
                    oppProduct.CompoundListPrice += getConvertedValue(oppProduct.LineItem.List_Price__c, conversionRate);
                    oppProduct.CompoundUnitPrice += getConvertedValue(oppProduct.LineItem.UnitPrice, conversionRate);
                }
            }

            return result;
        }        
        else
        {
            return null;
        }
    }

    public String BaseUrl
    {
        get
        {
            return URL.getSalesforceBaseUrl().toExternalForm();
        }
    }

    public class OpportunityWrapper
    {
        public Opportunity Opportunity { get; private set; }
        public String CompoundAmount { get; private set; }
        public String CompoundTotalRevenue { get; private set; }
        public String CompoundACVAmount { get; private set; }
        public String CompoundSITotal { get; private set; }

        public String CompoundTotalListPrice { get; private set; }
        public String CompoundTotalSalesPrice { get; private set; }
        public String CompoundTotalServiceListPrice { get; private set; }
        public String CompoundTotalServiceSalesPrice { get; private set; }

        public List<OpportunityProductWrapper> OpportunityProducts { get; private set; }
    }

    public class OpportunityProductWrapper
    {
        public OpportunityLineItem LineItem { get; private set; }
        public String CompoundListPrice { get; private set; }        
        public String CompoundUnitPrice { get; private set; }
    }

    private String convertToString(Decimal value, String currencyIsoCode)
    {
        if(value == null)
        {
            return '';
        }
        return currencyIsoCode + ' ' + value.setScale(0).format();
    }

    private Decimal getConversionRate(String currencyIsoCode)
    {
        Date today = Date.today();
        List<DatedConversionRate> conversionRates = [select IsoCode, ConversionRate 
                                                     from DatedConversionRate
                                                     where StartDate <= :today and 
                                                           NextStartDate >= :today and
                                                           IsoCode = :currencyIsoCode];
        if(conversionRates.size() > 0)
        {
            return conversionRates[0].ConversionRate;
        }
        return 1;
    }

    private String getConvertedValue(Decimal value, Decimal conversionRate)
    {
        if(value == null)
        {
            return '';
        }
        return ' (' + convertToString(value/conversionRate, 'USD') + ')'; 
    }
}