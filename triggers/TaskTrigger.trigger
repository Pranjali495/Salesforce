trigger TaskTrigger on Task (after insert) 
{
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            TaskTriggerHandler.setQuoteDocument(Trigger.new);
        }
    }
}