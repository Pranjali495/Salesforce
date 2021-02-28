trigger TimecardSplitBeforeAll on pse__Timecard__c (before delete, before insert, before update) {

    if ((Trigger.isInsert || Trigger.isUpdate) && CurrencyConversion.isAutoConversionEnabled()) {
        
        // Retrieve projects to get the opp close dates for exchange rate lookups
        Set<Id> projectIds = new Set<Id>();
        for (pse__Timecard__c tc : Trigger.new) {
            if (tc.pse__Project__c != null) {
                projectIds.add(tc.pse__Project__c);
            }
        }
        Map<Id, pse__Proj__c> projectsById = new Map<Id, pse__Proj__c>([SELECT Id, pse__Opportunity__r.CloseDate FROM pse__Proj__c WHERE Id IN :projectIds]);
        
        // Look up exchange rates
        List<pse__Timecard__c> timecardsWithConversions = new List<pse__Timecard__c>();
        List<CurrencyConversion> conversions = new List<CurrencyConversion>();
        for (pse__Timecard__c tc : Trigger.new) {
            pse__Proj__c proj = projectsById.get(tc.pse__Project__c);
            if (proj != null) {
                timecardsWithConversions.add(tc);
                conversions.add(new CurrencyConversion(tc.pse__Total_Billable_Amount__c, tc.CurrencyIsoCode, 'USD', proj.pse__Opportunity__r.CloseDate));
            }
        }
        conversions = CurrencyConversion.convertCurrencyAmounts(conversions);
        
        // Apply exchange rate conversions to milestones
        for (Integer i = 0; i < timecardsWithConversions.size(); i++) {
            timecardsWithConversions[i].USD_Amount__c = conversions[i].convCCYAmount;
        }
    }
}