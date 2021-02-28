public with sharing class CreateResourceRequestController {

    public Opportunity	opp			{ public get; private set; }
    public Boolean		showCreate	{ public get; private set; }
    
    private Boolean		proceedIfNotWon;
    
    public CreateResourceRequestController(ApexPages.StandardController stdCtlr) {
        opp = [SELECT Id, IsWon, pse__Region__c, pse__Practice__c FROM Opportunity WHERE Id = :stdCtlr.getId() LIMIT 1];
        showCreate = false;
        proceedIfNotWon = false;
    }
    
    public PageReference cancel() {
        return new PageReference('/' + opp.Id);
    }
    
    public PageReference proceedIfNotWon() {
        proceedIfNotWon = true;
        return validateAndUpdate();
    }
    
    public PageReference validateAndUpdate() {
        PageReference nextPage = null;
        if (!opp.IsWon && !proceedIfNotWon) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, 'This opportunity is not closed won, do you want to create the resource requests?'));
            showCreate = true;
        } else if (opp.pse__Region__c == null && opp.pse__Practice__c == null) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'You must go back to the Opportunity and select a Region and Practice before a Resource Request can be created.'));
            showCreate = false;
        } else {
            opp.Create_Resource_Requests__c = true;
        	try {
            	update opp;
            	nextPage = new PageReference('/' + opp.Id);
        	} catch (Exception e) {
            	ApexPages.addMessages(e);
            	showCreate = false;
        	}
        }
        return nextPage;
    }
}