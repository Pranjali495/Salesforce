@isTest
private class TestCreateResourceRequestController {

    static testMethod void testCreateForInvalidOpp() {
        
        Account acct = new Account(Name = 'Test Account');
        insert acct;
        
        Opportunity opp = new Opportunity(Name = 'Test Opp', AccountId = acct.Id, StageName = 'Open', CloseDate = Date.today());
        insert opp;
        
        opp = [SELECT pse__Practice__c, pse__Region__c FROM Opportunity WHERE Id = :opp.Id LIMIT 1];
        System.debug('practice=' + opp.pse__Practice__c + ', region=' + opp.pse__Region__c);
        
        CreateResourceRequestController ctlr = new CreateResourceRequestController(new ApexPages.StandardController(opp));
        ctlr.proceedIfNotWon();
        System.assert(ApexPages.getMessages()[0].getSummary().contains('select a Region and Practice'));
        System.assert(!ctlr.showCreate);
        ctlr.cancel();
    }
    
    static testMethod void testCreateForOpenOpp() {
        
        Account acct = new Account(Name = 'Test Account');
        insert acct;
        
        pse__Region__c reg = new pse__Region__c(Name = 'Test Region');
        insert reg;
        
        pse__Practice__c prac = new pse__Practice__c(Name = 'Test Practice');
        insert prac;
        
        Opportunity opp = new Opportunity(Name = 'Test Opp', AccountId = acct.Id, StageName = 'Open', CloseDate = Date.today(), pse__Region__c = reg.Id, pse__Practice__c = prac.Id);
        insert opp;
        
        CreateResourceRequestController ctlr = new CreateResourceRequestController(new ApexPages.StandardController(opp));
        ctlr.validateAndUpdate();
        System.assert(ApexPages.getMessages()[0].getSummary().contains('This opportunity is not closed won'));
        System.assert(ctlr.showCreate);
        
        ctlr.proceedIfNotWon();
        opp = [SELECT Create_Resource_Requests__c FROM Opportunity WHERE Id = :opp.Id LIMIT 1];
        System.assert(opp.Create_Resource_Requests__c);
    }
}