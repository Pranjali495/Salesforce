public with sharing class EditQuoteProductsExtension 
{    
    public Decimal ConversionRate { get; private set; }
    
    public EditQuoteProductsExtension(ApexPages.StandardController stdController) 
    {
        if(ConversionRate == null)
        {
            Opportunity opp = (Opportunity)stdController.getRecord();
            initConversionRateMap(opp.CurrencyIsoCode);
        }        
    }    
    
    // ContactType__c field select Options
    public String ContractTypeOptions
    {
        get
        {
            JSONGenerator gen = JSON.createGenerator(false);     
            gen.writeStartArray();
            gen.writeStartObject();
            gen.writeStringField('Value', '');
            gen.writeStringField('Label', '--None--');
            gen.writeEndObject();
            Schema.DescribeFieldResult dfr = OpportunityLineItem.ContractType__c.getDescribe();
            for(Schema.PicklistEntry entry : dfr.getPicklistValues())        
            {
                if(entry.isActive())
                {
                    gen.writeStartObject();
                    gen.writeStringField('Value', entry.getValue());
                    gen.writeStringField('Label', entry.getLabel());
                    gen.writeEndObject();
                }
            }      
            gen.writeEndArray();            
            return gen.getAsString();
        }
    }

    // Billingcommitment__c field select Options
    /*public String BillingcommittmentOptions
    {
        get
        {
            JSONGenerator gen = JSON.createGenerator(false);     
            gen.writeStartArray();
            gen.writeStartObject();
            gen.writeStringField('Value', '');
            gen.writeStringField('Label', '--None--');
            gen.writeEndObject();
            Schema.DescribeFieldResult dfr = OpportunityLineItem.Billingcommitment__c.getDescribe();
            for(Schema.PicklistEntry entry : dfr.getPicklistValues())        
            {
                if(entry.isActive())
                {
                    gen.writeStartObject();
                    gen.writeStringField('Value', entry.getValue());
                    gen.writeStringField('Label', entry.getLabel());
                    gen.writeEndObject();
                }
            }      
            gen.writeEndArray();            
            return gen.getAsString();
        }
    }*/

    private void initConversionRateMap(String currencyIsoCode)
    {
        Date today = Date.today();
        List<DatedConversionRate> conversionRates = [select IsoCode, ConversionRate 
                                                     from DatedConversionRate
                                                     where StartDate <= :today and 
                                                           NextStartDate >= :today and
                                                           IsoCode = :currencyIsoCode];
        if(conversionRates.size() > 0)
        {
            ConversionRate = conversionRates[0].ConversionRate;
        }
        else
        {
            ConversionRate = 1;
        }
    }

    @RemoteAction
    public static List<OpportunityLineItem> getOpportunityProducts(String opportunityId)
    {
        Opportunity opp = [select Total_Addressable_Revenue__c, NumberOfSites__c, CurrencyIsoCode,
                                (select Id, UnitPrice, List_Price__c, Discount__c, Quantity,
                                        OpportunityId, PricebookEntryId, POC_Terms__c, Hours_Info_Only__c, ContractType__c,
                                        PricebookEntry.UnitPrice, PricebookEntry.Product2Id,
                                        PricebookEntry.Product2.UseStandardPrice__c,
                                        PricebookEntry.Product2.Name,
                                        PricebookEntry.Product2.Family, 
                                        PricebookEntry.Product2.HoursEditable__c,
                                        PricebookEntry.Product2.Product_Sub_Category__c,
                                        PricebookEntry.Product2.ProductSubFamily__c,
                                        PricebookEntry.Product2.Hours__c,
                                        PricebookEntry.Product2.Integration_Rate__c
                                 from OpportunityLineItems
                                 order by PricebookEntry.Product2.Family,
                                          PricebookEntry.Product2.Product_Sub_Category__c,
                                          PricebookEntry.Product2.ProductSubFamily__c,
                                          PricebookEntry.Product2.Name)
                           from Opportunity where Id = :opportunityId];

        System.debug(opp.OpportunityLineItems);
        PriceCalculator.calculatePrice(opp, opp.OpportunityLineItems);
        System.debug(opp.OpportunityLineItems);
        return opp.OpportunityLineItems;        
    }

    @RemoteAction
    public static List<OpportunityLineItem> addProducts(String opportunityId,
                                                        String addedPricebookEntryIds,
                                                        List<OpportunityLineItem> oldLineItems)
    {
        List<OpportunityLineItem> addedLineItems = getAddedLineItems(opportunityId, addedPricebookEntryIds);
        if(oldLineItems == null || oldLineItems.size() == 0)
        {
            return addedLineItems;
        }
        else
        {
            return mergeLineItems(oldLineItems, addedLineItems);
        }
    }

    @RemoteAction
    public static void save(String opportunityId, List<OpportunityLineItem> lineItems)
    {
        Opportunity opp = [select Id, Name, AccountId, CurrencyIsoCode, Pricebook2Id, SyncedQuoteID
                            from Opportunity where Id = :opportunityId];
        
        Savepoint sp = Database.setSavepoint();
        try
        {
            // stop sync with the old quote
            stopQuoteSync(opp);

            upsert lineItems;
            System.debug(lineItems);

            Quote newQuote = createQuote(opp, lineItems);

            syncQuote(opp, newQuote.Id);     
        } 
        catch(Exception ex)
        {
            throw new CustomException(ex.getDmlMessage(0).unescapeHtml4(), ex);     
        }      
    }

    private static List<OpportunityLineItem> getAddedLineItems(String opportunityId, String addedPricebookEntryIds)
    {
        List<OpportunityLineItem> addedLineItems = new List<OpportunityLineItem>();

        Opportunity opp = [select Total_Addressable_Revenue__c, NumberOfSites__c, CurrencyIsoCode
                           from Opportunity where Id = :opportunityId];

        List<String> pricebookEntryIds = addedPricebookEntryIds.split(';'); 
        for(PricebookEntry entry : [select Id, Product2Id, UnitPrice, Product2.Name,
                                           Product2.Family, Product2.Product_Sub_Category__c,
                                           Product2.ProductSubFamily__c, Product2.Hours__c,
                                           Product2.Integration_Rate__c, 
                                           Product2.UseStandardPrice__c,
                                           Product2.HoursEditable__c
                                    from PricebookEntry where Id in :pricebookEntryIds])
        {
            Decimal hours = getDefaultHours(entry.Product2.Hours__c, opp.NumberOfSites__c, entry.Product2.Family);            
            addedLineItems.add(new OpportunityLineItem(OpportunityId = opportunityId,
                                                       PricebookEntry = entry,
                                                       PricebookEntryId = entry.Id,
                                                       List_Price__c = 0,
                                                       //UnitPrice = 0,
                                                       Discount__c = 0,
                                                       Quantity = 1,
                                                       Hours_Info_Only__c = hours));
        }          
        PriceCalculator.calculatePrice(opp, addedLineItems);
        return addedLineItems;
    }

    private static Decimal getDefaultHours(Decimal productHours, Decimal numberOfSites, String family)
    {
        if(family != 'Integration' && family != 'Services')
        {
            return productHours;
        }
        // Based on Julie's response on 10/18/2016, the NumberofSites should not
        // be included in the pricing calculation.
        /*if(productHours != null && numberOfSites != null && numberOfSites > 0)
        {
            return productHours * numberOfSites;
        }*/
        return productHours;     
    }

    private static List<OpportunityLineItem> mergeLineItems(List<OpportunityLineItem> oldLineItems, List<OpportunityLineItem> addedLineItems)
    {
        oldLineItems.addAll(addedLineItems);
        Map<String, Map<String, List<OpportunityLineItem>>> lineItemMap = getLineItemMap(oldLineItems);
        List<OpportunityLineItem> newLineItems = new List<OpportunityLineItem>();
        for(String category : lineItemMap.keySet())
        {
            for(String subCategory : lineItemMap.get(category).keySet())
            {
                newLineItems.addAll(lineItemMap.get(category).get(subCategory));
            }
        }
        return newLineItems;
    }

    private static Map<String, Map<String, List<OpportunityLineItem>>> getLineItemMap(List<OpportunityLineItem> lineItems)
    {
        Map<String, Map<String, List<OpportunityLineItem>>> lineItemMap = new Map<String, Map<String, List<OpportunityLineItem>>>();
        String category;
        String subCategory;
        for(OpportunityLineItem lineItem : lineItems)
        {
            category = lineItem.PricebookEntry.Product2.Family;
            subCategory = lineItem.PricebookEntry.Product2.Product_Sub_Category__c;            
            if(!lineItemMap.containsKey(category))
            {
                lineItemMap.put(category, new Map<String, List<OpportunityLineItem>>());
            }
            if(!lineItemMap.get(category).containsKey(subCategory))
            {
                lineItemMap.get(category).put(subCategory, new List<OpportunityLineItem>());
            }
            lineItemMap.get(category).get(subCategory).add(lineItem);
        }
        return lineItemMap;
    }

    private static void stopQuoteSync(Opportunity opp)
    {
        if(opp.Pricebook2Id == null)
        {
            opp.Pricebook2Id = [select Id from Pricebook2 where IsStandard = true].Id;
        }
        opp.SyncedQuoteID = null;
        update opp;
    }

    private static Quote createQuote(Opportunity opp, List<OpportunityLineItem> lineItems)
    {        
        Quote newQuote = new Quote(OpportunityId = opp.Id,
                                   Name = opp.Name,
                                   Pricebook2Id = opp.Pricebook2Id);
        insert newQuote;

        system.debug('newQuote: ' + newQuote);

        List<QuoteLineItem> quoteItems = new List<QuoteLineItem>();
        for(OpportunityLineItem lineItem : lineItems)
        {
            quoteItems.add(new QuoteLineItem(QuoteId = newQuote.Id,
                                             PricebookEntryId = lineItem.PricebookEntryId,
                                             Quantity = lineItem.Quantity,
                                             UnitPrice = lineItem.UnitPrice,
                                             List_Price__c = lineItem.List_Price__c,
                                             POC_Terms__c = lineItem.POC_Terms__c,
                                             Discount__c = lineItem.Discount__c,
                                             Hours_Info_Only__c = lineItem.Hours_Info_Only__c,
                                             //adding in % Paid Out field
                                             Percentage_Paid_Out__c = lineItem.Percentage_Paid_Out__c,
                                             //adding Next Deferral Date and Commission Notes Fields
                                             Commission_Notes__c = lineItem.Commission_Notes__c,
                                             Next_Deferral_Release_Date__c = lineItem.Next_Deferral_Release_Date__c,
                                             //adding ContractType__c and Billingcommitment__c fields
                                             ContractType__c = lineItem.ContractType__c
                                             //Billingcommitment__c = lineItem.Billingcommitment__c
                                             ));
        }

        system.debug('quoteItems: ' + quoteItems);
        if(quoteItems.size() > 0)
        {
            insert quoteItems;
        }        

        return newQuote;
    }

    private static void syncQuote(Opportunity opp, String quoteId)
    {
        opp.SyncedQuoteID = quoteId;
        update opp;
    }
}