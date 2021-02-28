trigger MiscellaneousAdjustmentAfterAll on pse__Miscellaneous_Adjustment__c (after delete, after insert, after undelete, after update) {

    Set<Id> projectIds = new Set<Id>();
    for (pse__Miscellaneous_Adjustment__c ma : (Trigger.isDelete ? Trigger.old : Trigger.new)) {
        projectIds.add(ma.pse__Project__c);
        if (Trigger.isUpdate) {
            projectIds.add(Trigger.oldMap.get(ma.Id).pse__Project__c);
        }
    }
    if (!projectIds.isEmpty()) {
        ProjectUtils.updateProjectsFromMiscellaneousAdjustments(projectIds);
    }
}