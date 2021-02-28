@isTest
public with sharing class TestDataFactory 
{
    public static void createBasePriceSetting()
    {
        List<BasePriceTable__c> settings = new List<BasePriceTable__c>();

        settings.add(new BasePriceTable__c(Name = '1', TierPriceStart__c = 2000000, TierPriceEnd__c = 24999999, TierCostPercent__c = 0.00500, PriceCap__c = 43750));
        settings.add(new BasePriceTable__c(Name = '2', TierPriceStart__c = 25000000, TierPriceEnd__c = 49999999, TierCostPercent__c = 0.00175, PriceCap__c = 50000));
        settings.add(new BasePriceTable__c(Name = '3', TierPriceStart__c = 50000000, TierPriceEnd__c = 499999999, TierCostPercent__c = 0.00100, PriceCap__c = 425000));
        settings.add(new BasePriceTable__c(Name = '4', TierPriceStart__c = 500000000, TierPriceEnd__c = 699999999, TierCostPercent__c = 0.00085, PriceCap__c = 455000));
        settings.add(new BasePriceTable__c(Name = '5', TierPriceStart__c = 700000000, TierPriceEnd__c = 999999999, TierCostPercent__c = 0.00065, PriceCap__c = 500000));
        settings.add(new BasePriceTable__c(Name = '6', TierPriceStart__c = 1000000000, TierPriceEnd__c = 1999999999, TierCostPercent__c = 0.00050, PriceCap__c = 600000));
        Database.insert(settings, false);   
    }    
    public static void createProductPriceSetting()
    {
        List<ProductPriceTable__c> settings = new List<ProductPriceTable__c>();
        settings.add(new ProductPriceTable__c(Name = '1', ProductFamily__c = 'Recommend', PercentOfBase__c = 1, DependentProduct__c = '', BundleDiscount__c = 1));
        settings.add(new ProductPriceTable__c(Name = '2', ProductFamily__c = 'CNET DataSource', PercentOfBase__c = 0.4000, DependentProduct__c = '', BundleDiscount__c = 1));
        settings.add(new ProductPriceTable__c(Name = '3', ProductFamily__c = 'BYOS', PercentOfBase__c = 0.2000, DependentProduct__c = '', BundleDiscount__c = 1));
        settings.add(new ProductPriceTable__c(Name = '4', ProductFamily__c = 'Discover', PercentOfBase__c = 0.7500, DependentProduct__c = 'Recommend', BundleDiscount__c = 0.85));
        settings.add(new ProductPriceTable__c(Name = '5', ProductFamily__c = 'Engage', PercentOfBase__c = 0.5000, DependentProduct__c = 'Recommend;Discover', BundleDiscount__c = 0.85));
        settings.add(new ProductPriceTable__c(Name = '6', ProductFamily__c = 'Build', PercentOfBase__c = 0.2500, DependentProduct__c = 'Recommend;Discover;Engage', BundleDiscount__c = 0.85));
        settings.add(new ProductPriceTable__c(Name = '7', ProductFamily__c = 'BYO-API', PercentOfBase__c = 0.0250, DependentProduct__c = 'Recommend;Discover;Engage', BundleDiscount__c = 0.85));
        Database.insert(settings, false);
    }
    public static Account createAccount(String accountName)
    {
        return new Account(Name = accountName);
    }

    public static Contact createContact(String accountId, String firstName, String lastName, String email)
    {
        return new Contact(AccountId = accountId, 
                           FirstName = firstName, 
                           LastName = lastName, 
                           Email = email);
    }

    public static Opportunity createOpportunity(String accountId, String oppName, String stage, Date closeDate, String currencyIsoCode)
    {
        return new Opportunity(AccountId = accountId, 
                               Name = oppName, 
                               StageName = stage, 
                               CloseDate = closeDate, 
                               CurrencyIsoCode = currencyIsoCode);
    }

    public static Product2 createProduct(String name, String code, Boolean isActive)
    {
        return new Product2(Name = name, ProductCode = code, IsActive = isActive);
    }

    public static PricebookEntry createPricebookEntry(String productId, String pricebookId, String currencyIsoCode, Decimal unitPrice, Boolean isActive)
    {
        return new PricebookEntry(Product2Id = productId,
                                  Pricebook2Id = pricebookId,
                                  CurrencyIsoCode = currencyIsoCode,
                                  UnitPrice = unitPrice,
                                  IsActive = isActive);
    }

    public static OpportunityLineItem addProduct2Opportunity(String opportunityId, String pricebookEntryId, Decimal unitPrice, Decimal quantity, Decimal discount)
    {
        return new OpportunityLineItem(OpportunityId = opportunityId,
                                       PricebookEntryId = pricebookEntryId,
                                       UnitPrice = unitPrice,
                                       Quantity = quantity,
                                       Discount = discount);
    }

    public static Quote createQuoteFromOpportunity(Opportunity opp, List<OpportunityLineItem> lineItems)
    {        
        Quote newQuote = new Quote(OpportunityId = opp.Id,
                                   Name = opp.Name,
                                   Pricebook2Id = opp.Pricebook2Id);
        Database.insert(newQuote, false);

        List<QuoteLineItem> quoteItems = new List<QuoteLineItem>();
        for(OpportunityLineItem lineItem : lineItems)
        {
            quoteItems.add(new QuoteLineItem(QuoteId = newQuote.Id,
                                             PricebookEntryId = lineItem.PricebookEntryId,
                                             Quantity = lineItem.Quantity,
                                             UnitPrice = lineItem.UnitPrice,
                                             List_Price__c = lineItem.List_Price__c,
                                             POC_Terms__c = lineItem.POC_Terms__c,
                                             Discount = lineItem.Discount));
        }
        Database.insert(quoteItems, false);

        return newQuote;
    }
    
    public static User createUser(Profile p) { 
        long l 			= (long) (Math.random() * 10000000.0);
        String userId 	= String.valueOf(l);
        
        User u = new User(
            Alias 				= userId, 
            Email 				= userId + '@vce.com', 
            EmailEncodingKey 	= 'UTF-8', 
            LastName 			= 'TestMgr', 
            LanguageLocaleKey 	= 'en_US', 
            LocaleSidKey 		= 'en_US', 
            ProfileId 			= p.Id, 
            TimeZoneSidKey 		= 'America/Los_Angeles', 
            UserName 			= userId + '@vce.com',
            IsActive 			= true
        );
        return u;
	}
    
    public static Profile getProfile() {
        Profile p 		= [SELECT Id FROM Profile WHERE Name = 'System Administrator']; 
		return p;		
	}
}