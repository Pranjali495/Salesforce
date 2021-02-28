@isTest
private class TestTimecardUtils {

    static testMethod void testTimecardValidation() {
    
        Date projStart = Date.today().toStartOfWeek().addDays(-7);
        Date projEnd = Date.today().addMonths(1);

        pse__Region__c region = new pse__Region__c(Name = 'Test Region');
        insert region;
        
        pse__Permission_Control__c pc = new pse__Permission_Control__c(
            pse__User__c = UserInfo.getUserId(),
            pse__Region__c = region.Id,
            pse__Staffing__c = true
        );
        insert pc;
        
        pse__Work_Calendar__c wc = new pse__Work_Calendar__c(Name = 'Test Calendar');
        insert wc;
        
        Contact ctct = new Contact(
            LastName='test',
            Email = 'test@test.org',
            pse__Resource_Role__c = 'Consultant',
            pse__Salesforce_User__c = UserInfo.getUserId(),
            pse__Is_Resource__c = true,
            pse__Is_Resource_Active__c = true,
            pse__Region__c = region.Id,
            pse__Start_Date__c = projStart,
            pse__Work_Calendar__c = wc.Id
        );
        insert ctct;
   
        pse__Proj__c proj = new pse__Proj__c(
            Name = 'Test Project',
            pse__Is_Active__c = true,
            pse__Is_Billable__c = true,
            pse__Region__c = region.Id,
            pse__Start_Date__c = projStart,
            pse__End_Date__c = projEnd
        );
        insert proj;
        
        pse__Schedule__c sched = new pse__Schedule__c(
            pse__Start_Date__c = projEnd,
            pse__End_Date__c = projEnd,
            pse__Monday_Hours__c = 8,
            pse__Tuesday_Hours__c = 8,
            pse__Wednesday_Hours__c = 8,
            pse__Thursday_Hours__c = 8,
            pse__Friday_Hours__c = 8
        );
        insert sched;
        
        pse__Assignment__c asst = new pse__Assignment__c(
            pse__Schedule__c = sched.Id,
            pse__Resource__c = ctct.Id,
            pse__Bill_Rate__c = 200,
            pse__Cost_Rate_Amount__c = 100,
            pse__Project__c = proj.Id,
            pse__Planned_Hours__c = 100,
            pse__Billable_Hours_Submitted__c = 40,
            pse__Non_Billable_Hours_Submitted__c = 40
        );
        insert asst;
        
        pse__Timecard_Header__c tc = new pse__Timecard_Header__c(
            pse__Assignment__c = asst.Id,
            pse__Monday_Hours__c = 8,
            pse__Tuesday_Hours__c = 8,
            pse__Wednesday_Hours__c = 8,
            pse__Thursday_Hours__c = 8,
            pse__Friday_Hours__c = 8,
            pse__Resource__c = ctct.Id,
            pse__Project__c = proj.Id,
            pse__End_Date__c = projStart.addDays(6),
            pse__Start_Date__c = projStart,
            pse__Status__c = 'Submitted'
        );
        try {
            insert tc;
        } catch (Exception e) {
            System.debug(e.getMessage());
            System.assert(e.getMessage().contains('exceed planned hours'));
        }
    }
}