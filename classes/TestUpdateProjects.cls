@isTest
private class TestUpdateProjects {

    static testMethod void testController() {
        
        Account acct = new Account(Name = 'Test Account');
        insert acct;
        
        Opportunity opp = new Opportunity(Name = 'Test Opp', AccountId = acct.Id, StageName = 'Open', CloseDate = Date.today());
        insert opp;
        
        pse__Proj__c proj = new pse__Proj__c(Name = 'Test Project', pse__Opportunity__c = opp.Id, pse__Is_Active__c = true, pse__Is_Billable__c = true, CurrencyIsoCode = 'EUR', pse__Allow_Timecards_Without_Assignment__c = true, pse__Revenue__c = 1000);
        insert proj;
        
        UpdateProjectsController ctlr = new UpdateProjectsController();
        Test.startTest();
        ctlr.startJob();
        Test.stopTest();
        
        System.assert(ctlr.jobStarted);
        proj = [SELECT pse__Revenue__c, USD_Revenue__c FROM pse__Proj__c WHERE Id = :proj.Id LIMIT 1];
        System.assertEquals(proj.pse__Revenue__c / CurrencyConversion.TEST_CONV_RATE, proj.USD_Revenue__c);
    }
}