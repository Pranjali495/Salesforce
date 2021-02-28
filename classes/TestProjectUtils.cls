@isTest
private class TestProjectUtils {

    static testMethod void testBillableMilestoneFlag() {
        
        pse__Proj__c proj = new pse__Proj__c(Name = 'Test Project', pse__Is_Active__c = true);
        insert proj;
        
        pse__Milestone__c ms = new pse__Milestone__c(pse__Project__c = proj.Id, pse__Target_Date__c = Date.today().addDays(7), pse__Milestone_Amount__c = 0);
        insert ms;
        
        proj = [SELECT Has_Billable_Milestone__c FROM pse__Proj__c WHERE Id = :proj.Id LIMIT 1];
        System.assert(!proj.Has_Billable_Milestone__c);
        
        ms.pse__Milestone_Amount__c = 1;
        update ms;
        
        proj = [SELECT Has_Billable_Milestone__c FROM pse__Proj__c WHERE Id = :proj.Id LIMIT 1];
        System.assert(proj.Has_Billable_Milestone__c);
        
        delete ms;
        proj = [SELECT Has_Billable_Milestone__c FROM pse__Proj__c WHERE Id = :proj.Id LIMIT 1];
        System.assert(!proj.Has_Billable_Milestone__c);
    }
}