trigger UpdateCSDirector on User (after update) 
{
    List<String> userIds = new List<String>();

    Map<Id, User> oldUserMap = Trigger.oldMap;
    for(User u : Trigger.new)
    {
        if(u.CSDirector__c != oldUserMap.get(u.Id).CSDirector__c)
        {
            userIds.add(u.Id);
        }
    }

    if(userIds.size() > 0)
    {
        List<Opportunity> opportunities = [select CS_Director__c, CSDirectorId__c from Opportunity where OwnerId in :userIds];
        if(opportunities.size() > 0)
        {
            for(Opportunity opp : opportunities)
            {
                opp.CS_Director__c = opp.CSDirectorId__c;
            }
            Database.update(opportunities, false);
        }
    }
}