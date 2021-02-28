@isTest
private class TestMilestones {

    // Setting project CurrencyIsoCode to anything other than USD results in validation failure when milestone is inserted.
    // Error states that dated exchange rates are not supported in this org.
    // Miscellaneous Adjustments are affected similarly, but not Timecard Splits.
    // In the UI, all three record types can be created with non-USD currencies specified.
    // The problem appears to only affect test classes.
    static testMethod void testAmountConversion() {
        
        Account acct = new Account(Name = 'Test Account');
        insert acct;
        
        Opportunity opp = new Opportunity(Name = 'Test Opp', AccountId = acct.Id, StageName = 'Open', CloseDate = Date.today());
        insert opp;
        
        pse__Proj__c proj = new pse__Proj__c(Name = 'Test Project', pse__Opportunity__c = opp.Id, pse__Is_Active__c = true, CurrencyIsoCode = 'USD');
        insert proj;
        
        pse__Milestone__c ms = new pse__Milestone__c(pse__Project__c = proj.Id, pse__Target_Date__c = Date.today().addDays(7), pse__Milestone_Amount__c = 100, CurrencyIsoCode = 'USD');
        insert ms;
        ms = [SELECT USD_Amount__c FROM pse__Milestone__c WHERE Id = :ms.Id LIMIT 1];
        System.assertEquals(100, ms.USD_Amount__c);
    }
}