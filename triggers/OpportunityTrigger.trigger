trigger OpportunityTrigger on Opportunity (before insert, before update, after update) 
{
    if(Trigger.isBefore)
    {
        if(Trigger.isInsert || Trigger.isUpdate)
        {
            OpportunityTriggerHandler.setCSDirectorField(Trigger.new);
        }        
    }
    else if(Trigger.isAfter)
    {
        if(Trigger.isUpdate)
        {
            // Based on Julie's response on 10/18/2016, the NumberofSites should not
            // be included in the pricing calculation.
            //OpportunityTriggerHandler.recalculateOpportunityProductQuantity(Trigger.newMap, Trigger.oldMap);

            OpportunityTriggerHandler.recalculateOpportunityProductPrice(Trigger.newMap, Trigger.oldMap);            
        }
    }
}