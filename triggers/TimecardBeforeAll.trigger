trigger TimecardBeforeAll on pse__Timecard_Header__c (before delete, before insert, before update) {

    if (Trigger.isInsert || Trigger.isUpdate) {
        TimecardUtils.validateTimecards(Trigger.new, Trigger.isUpdate ? Trigger.oldMap : null);
    }
}