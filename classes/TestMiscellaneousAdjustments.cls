@isTest
private class TestMiscellaneousAdjustments {

    // Setting project CurrencyIsoCode to anything other than USD results in validation failure when misc adjustment is inserted.
    // Error states that dated exchange rates are not supported in this org.
    // Milestones are affected similarly, but not Timecard Splits.
    // In the UI, all three record types can be created with non-USD currencies specified.
    // The problem appears to only affect test classes.
    static testMethod void testAmountConversion() {
        
        Account acct = new Account(Name = 'Test Account');
        insert acct;
        
        Opportunity opp = new Opportunity(Name = 'Test Opp', AccountId = acct.Id, StageName = 'Open', CloseDate = Date.today());
        insert opp;
        
        pse__Proj__c proj = new pse__Proj__c(Name = 'Test Project', pse__Opportunity__c = opp.Id, pse__Is_Active__c = true, pse__Is_Billable__c = true, CurrencyIsoCode = 'USD', pse__Allow_Timecards_Without_Assignment__c = true);
        insert proj;

        pse__Miscellaneous_Adjustment__c ma = new pse__Miscellaneous_Adjustment__c(Name = 'Test Adjustment', pse__Project__c = proj.Id, pse__Transaction_Category__c = 'Other Cost', pse__Effective_Date__c = Date.today(), pse__Amount__c = 100, CurrencyIsoCode = 'USD');
        insert ma;
        ma = [SELECT USD_Amount__c FROM pse__Miscellaneous_Adjustment__c WHERE Id = :ma.Id LIMIT 1];
        System.assertEquals(100, ma.USD_Amount__c);
    }
}