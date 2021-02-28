trigger MilestoneBeforeAll on pse__Milestone__c (before delete, before insert, before update) {

    if ((Trigger.isInsert || Trigger.isUpdate) && CurrencyConversion.isAutoConversionEnabled()) {
        
        // Retrieve projects to get the opp close dates for exchange rate lookups
        Set<Id> projectIds = new Set<Id>();
        for (pse__Milestone__c ms : Trigger.new) {
            if (ms.pse__Project__c != null) {
                projectIds.add(ms.pse__Project__c);
            }
        }
        Map<Id, pse__Proj__c> projectsById = new Map<Id, pse__Proj__c>([SELECT Id, pse__Opportunity__r.CloseDate FROM pse__Proj__c WHERE Id IN :projectIds]);
        
        // Look up exchange rates
        List<CurrencyConversion> conversions = new List<CurrencyConversion>();
        for (pse__Milestone__c ms : Trigger.new) {
            pse__Proj__c proj = projectsById.get(ms.pse__Project__c);
            if (proj != null) {
                conversions.add(new CurrencyConversion(ms.pse__Milestone_Amount__c, ms.CurrencyIsoCode, 'USD', proj.pse__Opportunity__r.CloseDate));
            }
        }
        conversions = CurrencyConversion.convertCurrencyAmounts(conversions);
        
        // Apply exchange rate conversions to milestones
        for (Integer i = 0; i < Trigger.new.size(); i++) {
            Trigger.new[i].USD_Amount__c = conversions[i].convCCYAmount;
        }
    }
}