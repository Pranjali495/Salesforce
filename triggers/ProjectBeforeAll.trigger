trigger ProjectBeforeAll on pse__Proj__c (before delete, before insert, before update) {

    if ((Trigger.isInsert || Trigger.isUpdate) && CurrencyConversion.isAutoConversionEnabled()) {
        // Retrieve opp close dates for exchange rate lookups
        Set<Id> oppIds = new Set<Id>();
        for (pse__Proj__c p : Trigger.new) {
            if (p.pse__Opportunity__c != null) {
                oppIds.add(p.pse__Opportunity__c);
            }
        }
        Map<Id, Opportunity> oppsById = new Map<Id, Opportunity>([SELECT Id, CloseDate FROM Opportunity WHERE Id IN :oppIds]);
        
        // Look up exchange rates
        List<pse__Proj__c> projectsWithConversions = new List<pse__Proj__c>();
        List<CurrencyConversion> conversions = new List<CurrencyConversion>();
        for (pse__Proj__c p : Trigger.new) {
            Opportunity opp = oppsById.get(p.pse__Opportunity__c);
            if (opp != null) {
                projectsWithConversions.add(p);
                conversions.add(new CurrencyConversion(1.0, p.CurrencyIsoCode, 'USD', opp.CloseDate));
            }
        }
        conversions = CurrencyConversion.convertCurrencyAmounts(conversions);
        
        // Apply exchange rate conversions to project fields
        for (Integer i = 0; i < projectsWithConversions.size(); i++) {
            projectsWithConversions[i].USD_Bookings__c = projectsWithConversions[i].pse__Bookings__c != null ? projectsWithConversions[i].pse__Bookings__c * conversions[i].convCCYAmount : null;
            projectsWithConversions[i].USD_Internal_Budget__c = projectsWithConversions[i].pse__Internal_Budget__c != null ? projectsWithConversions[i].pse__Internal_Budget__c * conversions[i].convCCYAmount : null;
            projectsWithConversions[i].USD_Expense_Budget__c = projectsWithConversions[i].pse__Expense_Budget__c != null ? projectsWithConversions[i].pse__Expense_Budget__c * conversions[i].convCCYAmount : null;
            projectsWithConversions[i].USD_Billings__c = projectsWithConversions[i].pse__Billings__c != null ? projectsWithConversions[i].pse__Billings__c * conversions[i].convCCYAmount : null;
            projectsWithConversions[i].USD_Revenue__c = projectsWithConversions[i].pse__Revenue__c != null ? projectsWithConversions[i].pse__Revenue__c * conversions[i].convCCYAmount : null;
        }
    }
}