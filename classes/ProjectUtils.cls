public class ProjectUtils {
/* not ready for deployment...
    public static void rollupBudgetsToProjects(Set<Id> projectIds) {
        
        List<pse__Proj__c> projectsToUpdate = new List<pse__Proj__c>();
        for (pse__Proj__c p : [SELECT Id, Number_of_Budgets__c, (SELECT Id FROM pse__Budgets__r) FROM pse__Proj__c WHERE Id IN :projectIds]) {
            p.Number_of_Budgets__c = p.pse__Budgets__r.size();
            projectsToUpdate.add(p);
        }
        if (!projectsToUpdate.isEmpty()) {
            update projectsToUpdate;
        }
    }
*/    
    public static void updateProjectsFromMilestones(Set<Id> projectIds) {
        
        List<pse__Proj__c> projectsToUpdate = new List<pse__Proj__c>();
        for (pse__Proj__c proj : [SELECT Has_Billable_Milestone__c, Total_Milestone_USD_Amount__c, (SELECT Id, USD_Amount__c FROM pse__Milestones__r WHERE pse__Milestone_Amount__c > 0) FROM pse__Proj__c WHERE Id IN :projectIds]) {
            Boolean hasChanged = false;
            
            // Update Has Billable Milestone check box
            Boolean hasBillableMilestone = !proj.pse__Milestones__r.isEmpty();
            if (proj.Has_Billable_Milestone__c != hasBillableMilestone) {
                proj.Has_Billable_Milestone__c = hasBillableMilestone;
                hasChanged = true;
            }
            
            // Aggregate milestone USD amounts
            Decimal msUSDAmt = 0;
            for (pse__Milestone__c ms : proj.pse__Milestones__r) {
                if (ms.USD_Amount__c != null) {
                    msUSDAmt += ms.USD_Amount__c;
                }
            }
            if (proj.Total_Milestone_USD_Amount__c != msUSDAmt) {
                proj.Total_Milestone_USD_Amount__c = msUSDAmt;
                hasChanged = true;
            }
            
            if (hasChanged) {
                projectsToUpdate.add(proj);
            }
        }
        if (!projectsToUpdate.isEmpty()) {
            update projectsToUpdate;
        }
    }
    
    public static void updateProjectsFromMiscellaneousAdjustments(Set<Id> projectIds) {
        
        List<pse__Proj__c> projectsToUpdate = new List<pse__Proj__c>();
        for (pse__Proj__c proj : [SELECT Total_Miscellaneous_Adjustment_USD_Amt__c, (SELECT Id, USD_Amount__c FROM pse__Miscellaneous_Adjustments__r) FROM pse__Proj__c WHERE Id IN :projectIds]) {
            
            // Aggregate misc adjustment USD amounts
            Decimal maUSDAmt = 0;
            for (pse__Miscellaneous_Adjustment__c ma : proj.pse__Miscellaneous_Adjustments__r) {
                if (ma.USD_Amount__c != null) {
                    maUSDAmt += ma.USD_Amount__c;
                }
            }
            if (proj.Total_Miscellaneous_Adjustment_USD_Amt__c != maUSDAmt) {
                proj.Total_Miscellaneous_Adjustment_USD_Amt__c = maUSDAmt;
                projectsToUpdate.add(proj);
            }
        }
        if (!projectsToUpdate.isEmpty()) {
            update projectsToUpdate;
        }
    }
    
    public static void updateProjectsFromTimecardSplits(Set<Id> projectIds) {
        
        List<pse__Proj__c> projectsToUpdate = new List<pse__Proj__c>();
        for (pse__Proj__c proj : [SELECT Total_Timecard_USD_Amount__c, (SELECT Id, USD_Amount__c FROM pse__TimecardSplits__r) FROM pse__Proj__c WHERE Id IN :projectIds]) {
            
            // Aggregate timecard split USD amounts
            Decimal tcUSDAmt = 0;
            for (pse__Timecard__c tc : proj.pse__TimecardSplits__r) {
                if (tc.USD_Amount__c != null) {
                    tcUSDAmt += tc.USD_Amount__c;
                }
            }
            if (proj.Total_Timecard_USD_Amount__c != tcUSDAmt) {
                proj.Total_Timecard_USD_Amount__c = tcUSDAmt;
                projectsToUpdate.add(proj);
            }
        }
        if (!projectsToUpdate.isEmpty()) {
            update projectsToUpdate;
        }
    }
}