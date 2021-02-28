trigger TimecardSplitAfterAll on pse__Timecard__c (after delete, after insert, after undelete, after update) {

    Set<Id> projectIds = new Set<Id>();
    for (pse__Timecard__c tc : (Trigger.isDelete ? Trigger.old : Trigger.new)) {
        projectIds.add(tc.pse__Project__c);
        if (Trigger.isUpdate) {
            projectIds.add(Trigger.oldMap.get(tc.Id).pse__Project__c);
        }
    }
    if (!projectIds.isEmpty()) {
        ProjectUtils.updateProjectsFromTimecardSplits(projectIds);
    }
}