@isTest
private class ProductLookupControllerTest 
{	
	@isTest 
    static void testProductLookupController() 
    {
        /* Create Test Data */        
        Account newAccount = TestDataFactory.createAccount('Test Account');
        Database.insert(newAccount, false);
        Contact newContact = 
            TestDataFactory.createContact(newAccount.Id, 'Test', 'Contact', 'test@acme.com');
        Database.insert(newContact, false);

        Opportunity newOpp = 
            TestDataFactory.createOpportunity(newAccount.Id, 'Test Opportunity', '(SaaS) Lead - 10%', Date.today().addMonths(1), 'EUR');
        Database.insert(newOpp, false);

        Product2 newProduct = TestDataFactory.createProduct('2.0 License: Recommend', 'License: Recommend', true);
        newProduct.Family = 'License';
        newProduct.Product_Sub_Category__c = 'Recommend';
        Database.insert(newProduct, false);

        String standardPricebookId = Test.getStandardPricebookId();        

        PricebookEntry entry = 
            TestDataFactory.createPricebookEntry(newProduct.Id, standardPricebookId, 'EUR', 100, true);
        Database.insert(entry, false); 
        /* Create Test Date End */

        Test.startTest();

        PageReference pageRef = new PageReference('/apex/ProductLookup?id=' + newOpp.Id);
        Test.setCurrentPage(pageRef);
        ProductLookupController controller = new ProductLookupController();
        List<SelectOption> categoryOptions = controller.ProductCategoryOptions;
        List<SelectOption> subCategoryOptions = controller.ProductSubCategoryOptions;
        controller.SelectedCategory = 'License';
        controller.SelectedSubCategory = 'Recommend';
        controller.Keyword = '2.0';
        List<PricebookEntry> pricebookEntries = controller.getPricebookEntries();

        Test.stopTest();
	}
}