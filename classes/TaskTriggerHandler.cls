public class TaskTriggerHandler 
{
    public static void setQuoteDocument(List<Task> tasks)
    {
        Map<String, List<Task>> opportunityTaskMap = new Map<String, List<Task>>();
        for(Task opportunityTask : [select WhatId, QuoteName__c, QuoteDocumentID__c, CreatedDate 
                                    from Task where What.Type = 'Opportunity' and Type = 'Email' 
                                                and IsClosed = true and Id in :tasks
                                                and Subject like 'Email: %'])
        {
            if(!opportunityTaskMap.containsKey(opportunityTask.WhatId))
            {
                opportunityTaskMap.put(opportunityTask.WhatId, new List<Task>());
            }
            opportunityTaskMap.get(opportunityTask.WhatId).add(opportunityTask);
        }

        if(opportunityTaskMap.size() > 0)
        {
            List<Task> tasksToUpdate = new List<Task>();
            for(Opportunity opp : [select Id, (select Id, Name, CreatedDate from Attachments order by CreatedDate desc limit 1) 
                                    from Opportunity where Id in :opportunityTaskMap.keySet()])
            {
                if(opp.Attachments.size() > 0)
                {
                    for(Task task : opportunityTaskMap.get(opp.Id))
                    {
                        task.QuoteName__c = opp.Attachments[0].Name;
                        task.QuoteDocumentID__c = opp.Attachments[0].Id;
                        tasksToUpdate.add(task);
                    }
                }
            }                                   

            if(tasksToUpdate.size() > 0)
            {
                Database.update(tasksToUpdate, false);
            } 
        }        
    }
}