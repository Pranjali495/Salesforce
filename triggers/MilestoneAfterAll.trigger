trigger MilestoneAfterAll on pse__Milestone__c (after delete, after insert, after undelete, after update) {

    Set<Id> projectIds = new Set<Id>();
    for (pse__Milestone__c ms : (Trigger.isDelete ? Trigger.old : Trigger.new)) {
        projectIds.add(ms.pse__Project__c);
        if (Trigger.isUpdate) {
            projectIds.add(Trigger.oldMap.get(ms.Id).pse__Project__c);
        }
    }
    if (!projectIds.isEmpty()) {
        ProjectUtils.updateProjectsFromMilestones(projectIds);
    }
}