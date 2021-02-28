public class TimecardUtils {

    public static void validateTimecards(List<pse__Timecard_Header__c> timecards, Map<Id, pse__Timecard_Header__c> previousValues) {
        
        Set<Id> assignmentIds = new Set<Id>();
        for (pse__Timecard_Header__c tc : timecards) {
            assignmentIds.add(tc.pse__Assignment__c);
        }
        Map<Id, pse__Assignment__c> assignmentsById = new Map<Id, pse__Assignment__c>([SELECT Id, Name, pse__Billable_Hours_Submitted__c, pse__Non_Billable_Hours_Submitted__c, pse__Planned_Hours__c FROM pse__Assignment__c WHERE Id IN :assignmentIds]);
        
        for (pse__Timecard_Header__c tc : timecards) {
            if (tc.pse__Status__c == 'Submitted' && (previousValues == null || previousValues.get(tc.Id).pse__Status__c != 'Submitted')) { // second condition allows admin edit of submitted timecard w/o double-counting the hours
                pse__Assignment__c asst = assignmentsById.get(tc.pse__Assignment__c);
                if (asst != null) {
                    Decimal plannedHours = asst.pse__Planned_Hours__c != null ? asst.pse__Planned_Hours__c : 0;
                    Decimal submittedBillableHours = asst.pse__Billable_Hours_Submitted__c != null ? asst.pse__Billable_Hours_Submitted__c : 0;
                    Decimal submittedNonbillableHours = asst.pse__Non_Billable_Hours_Submitted__c != null ? asst.pse__Non_Billable_Hours_Submitted__c : 0;
                    Decimal sunHours = tc.pse__Sunday_Hours__c != null ? tc.pse__Sunday_Hours__c : 0;
                    Decimal monHours = tc.pse__Monday_Hours__c != null ? tc.pse__Monday_Hours__c : 0;
                    Decimal tueHours = tc.pse__Tuesday_Hours__c != null ? tc.pse__Tuesday_Hours__c : 0;
                    Decimal wedHours = tc.pse__Wednesday_Hours__c != null ? tc.pse__Wednesday_Hours__c : 0;
                    Decimal thuHours = tc.pse__Thursday_Hours__c != null ? tc.pse__Thursday_Hours__c : 0;
                    Decimal friHours = tc.pse__Friday_Hours__c != null ? tc.pse__Friday_Hours__c : 0;
                    Decimal satHours = tc.pse__Saturday_Hours__c != null ? tc.pse__Saturday_Hours__c : 0;
                    Decimal submittedHours = sunHours + monHours + tueHours + wedHours + thuHours + friHours + satHours;
                    if (submittedBillableHours + submittedNonbillableHours + submittedHours > plannedHours) {
                        tc.addError('Submitted hours (' + (submittedBillableHours + submittedNonbillableHours + submittedHours) + ') exceed planned hours (' + plannedHours + ') for this assignment (' + asst.Name + ')');
                    }
                }
            }
        }
    }
}