@isTest
private class SendQuoteExtensionTest 
{   
    @isTest 
    static void testSendQuoteExtension() 
    {
        /* Create Test Data */
        Account newAccount = TestDataFactory.createAccount('Test Account');
        Database.insert(newAccount, false);

        Contact newContact = 
            TestDataFactory.createContact(newAccount.Id, 'Test', 'Contact', 'test@acme.com');
        Database.insert(newContact, false);

        Opportunity newOpp = 
            TestDataFactory.createOpportunity(newAccount.Id, 'Test Opportunity', '(SaaS) Lead - 10%', Date.today().addMonths(1), 'EUR');
            newOpp.Web_Online_Revenue__c = 2000000;
            newOpp.Web_Online_Perc_Addressable__c = 100;
            newOpp.Mobile_Revenue__c = 2000000;
            newOpp.Mobile_Addressable__c = 100;
            newOpp.NumberOfSites__c = 2;
        Database.insert(newOpp, false);

        Product2 newProd1 = TestDataFactory.createProduct('Lincese-Recommend', 'License-Recommend', true);
        newProd1.Family = 'License';
        newProd1.Product_Sub_Category__c = 'Recommend';

        Product2 newProd2 = TestDataFactory.createProduct('License-Recommend-BYOS', 'License-Recommend-BYOS', true);
        newProd2.Family = 'License';
        newProd2.Product_Sub_Category__c = 'Recommend';        
        newProd2.ProductSubFamily__c = 'BYOS';

        Product2 newProd3 = TestDataFactory.createProduct('Use Standard Price', 'Use Standard Price', true);
        newProd3.Family = 'License';
        newProd3.Product_Sub_Category__c = 'Legacy';
        newProd3.UseStandardPrice__c = true;


        Product2 newProd4 = TestDataFactory.createProduct('Services', 'Services', true);
        newProd4.Family = 'Service';
        newProd4.Product_Sub_Category__c = 'Platform';
        newProd4.Integration_Rate__c = 100;
        newProd4.Hours__c = 100;

        Product2 newProd5 = TestDataFactory.createProduct('Integration', 'Integration', true);
        newProd5.Family = 'Integration';
        newProd5.Product_Sub_Category__c = 'Recommend';
        newProd5.Integration_Rate__c = 100;
        newProd5.Hours__c = 100;

        List<Product2> newProducts = new List<Product2>{newProd1, newProd2, newProd3, newProd4, newProd5};                
        Database.insert(newProducts, false);

        String standardPricebookId = Test.getStandardPricebookId();        
        
        List<PricebookEntry> entries = new List<PricebookEntry>();
        entries.add(TestDataFactory.createPricebookEntry(newProd1.Id, standardPricebookId, 'EUR', 100, true));
        entries.add(TestDataFactory.createPricebookEntry(newProd2.Id, standardPricebookId, 'EUR', 100, true));
        entries.add(TestDataFactory.createPricebookEntry(newProd3.Id, standardPricebookId, 'EUR', 100, true));
        entries.add(TestDataFactory.createPricebookEntry(newProd4.Id, standardPricebookId, 'EUR', 100, true));        
        entries.add(TestDataFactory.createPricebookEntry(newProd5.Id, standardPricebookId, 'EUR', 100, true));        
        Database.insert(entries, false); 

        List<OpportunityLineItem> lineItems = new List<OpportunityLineItem>();
        lineItems.add(TestDataFactory.addProduct2Opportunity(newOpp.Id, entries[0].Id, 100, 1, 0));
        lineItems.add(TestDataFactory.addProduct2Opportunity(newOpp.Id, entries[1].Id, 100, 1, 0));
        lineItems.add(TestDataFactory.addProduct2Opportunity(newOpp.Id, entries[2].Id, 100, 1, 0));
        lineItems.add(TestDataFactory.addProduct2Opportunity(newOpp.Id, entries[3].Id, 100, 1, 0));
        lineItems.add(TestDataFactory.addProduct2Opportunity(newOpp.Id, entries[4].Id, 100, 1, 0));
        Database.insert(lineItems, false);

        newOpp = [select Id, Name, Pricebook2Id, SyncedQuoteID from Opportunity where Id = :newOpp.Id];
        Quote newQuote = TestDataFactory.createQuoteFromOpportunity(newOpp, lineItems);

        newOpp.SyncedQuoteID = newQuote.Id;
        update newOpp;
        /* Create Test Date End */  

        Test.startTest();

        ApexPages.StandardController stdController = new ApexPages.StandardController(newOpp);
        SendQuoteExtension extension = new SendQuoteExtension(stdController);

        extension.PrimaryQuote.ContactId = newContact.Id;
        extension.TempQuote.ContactId = newContact.Id;
        extension.Email.CCAddr = 'test2@acme.com';
        extension.Email.Body = 'Email Body';
        extension.send();
        
        Test.stopTest();    
    }   
}