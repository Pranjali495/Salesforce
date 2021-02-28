@isTest
private class TestTimecards {

    static testMethod void testAmountConversion() {
        
        User tstUsr = TestDataFactory.createUser(TestDataFactory.getProfile());
        insert tstUsr;
        
        Contact ctct = new Contact(LastName = 'Testcontact1', pse__Salesforce_User__c = tstUsr.Id, pse__Is_Resource__c = true, pse__Is_Resource_Active__c = true);
        insert ctct;
        
        Account acct = new Account(Name = 'Test Account');
        insert acct;
        
        Opportunity opp = new Opportunity(Name = 'Test Opp', AccountId = acct.Id, StageName = 'Open', CloseDate = Date.today());
        insert opp;
        
        pse__Proj__c proj = new pse__Proj__c(Name = 'Test Project', pse__Opportunity__c = opp.Id, pse__Is_Active__c = true, pse__Is_Billable__c = true, CurrencyIsoCode = 'EUR', pse__Allow_Timecards_Without_Assignment__c = true);
        insert proj;
        
        System.runAs(tstUsr) {
        	Date tcDate = Date.today();
        	pse__Timecard_Header__c tch = new pse__Timecard_Header__c(pse__Start_Date__c = tcDate, pse__End_Date__c = tcDate.addDays(6), pse__Project__c = proj.Id, pse__Resource__c = ctct.Id, CurrencyIsoCode = 'EUR');
        	insert tch;
        
        	pse__Timecard__c tc = new pse__Timecard__c(pse__Timecard_Header__c = tch.Id, pse__Start_Date__c = tcDate, pse__End_Date__c = tcDate.addDays(6), pse__Project__c = proj.Id, pse__Resource__c = ctct.Id, pse__Total_Billable_Amount__c = 100, CurrencyIsoCode = 'EUR');
        	insert tc;
            tc = [SELECT CurrencyIsoCode, USD_Amount__c FROM pse__Timecard__c WHERE Id = :tc.Id LIMIT 1];
            System.assertEquals('EUR', tc.CurrencyIsoCode);
            System.assertEquals(125, tc.USD_Amount__c);
        }
    }
}