/*
 * Controller Custom Opportunity Clone functionality
 *
 *@changelog
 *20DEC2016 - added CloseDate = System.Today() + 30 to prevent validation rule errors when cloning opportunities
 *02MAY2017 - Remove note section when clone opp, lcoate => Change No. C002
 */

public class CloneOpportunityController {
    
    public CloneOpportunityController(ApexPages.StandardController sc)
    {
    }
    
    public PageReference jumpToEdit()
    {
        String oppId = ApexPages.currentPage().getParameters().get('id');
        
        String clonePro = ApexPages.currentPage().getParameters().get('clonePro');
        if(oppId instanceOf Id)
        {
            Opportunity oldOpp = getOpp(oppId);
            Opportunity newOpp = oldOpp.Clone(false, true, false, false);
            newOpp.isCloned__c  = true;
            newOpp.pse__Primary_Project__c = null;
            newOpp.StageName = '(SaaS) Lead - 10%';
            newOpp.Probability = 10;
            newOpp.CloseDate = System.Today() + 30;
            newOpp.OwnerId = UserInfo.getUserId();
            newOpp.Operations_Check_Complete__c = false;
            newOpp.Market_Dev_Close_Date__c = null;
            //System.debug('New Opp: ');
            //System.debug(newOpp);
            try
            {
                insert newOpp;
                if(clonePro == '1')
                {
                    List<OpportunityLineItem> clonedOppItem = getClonedOppItem(oppId, newOpp.Id);
                    if(!clonedOppItem.isEmpty())
                    {
                        Database.insert(clonedOppItem);
                        //insert clonedOppItem;
                    }
                }
                return new PageReference('/' + newOpp.Id + '/e?retURL=' + newOpp.Id);
            }
            catch(DMLException ex)
            {
                system.debug(ex.getMessage());
                ApexPages.addMessages(ex);
                return null;
            }
        }
        else
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, 'Invalid Opportunity Id'));
            return null;
        }
    }
    
    private Opportunity getOpp(String oppId)
    {
        Set<String> s = Opportunity.SObjectType.getDescribe().fields.getMap().keySet();
        s.remove('syncedquoteid');
        List<String> fields = new List<String>(s);
        String soql = ' select ' + String.join(fields, ', ') + ' from Opportunity' + ' where Id =: oppId limit 1';
        return Database.query(soql);
    }
    
    private List<OpportunityLineItem> getClonedOppItem(String OppId, String clonedId)
    {
        Set<String> s = OpportunityLineItem.SObjectType.getDescribe().fields.getMap().keySet();
        s.remove('totalprice');
        List<String> fields = new List<String>(s);
        String soql = ' select ' + String.join(fields, ', ') + ' from OpportunityLineItem' + ' where OpportunityId =: oppId';
        //String soql = 'Select Id, OpportunityId, Quantity, UnitPrice, PricebookEntryId, pse__Added_To_Project__c from OpportunityLineItem where OpportunityId =: oppId';
        List<OpportunityLineItem> clonedOppItem = new List<OpportunityLineItem>();
        for(OpportunityLineItem item : Database.query(soql))
        {
            OpportunityLineItem cloneItem = item.clone();
            cloneItem.pse__Added_To_Project__c = false;
            cloneItem.OpportunityId = clonedId;
            cloneItem.Commission_Notes__c = '';// [Change No. C002]
            clonedOppItem.add(cloneItem);
        }
        return clonedOppItem;
    }
}