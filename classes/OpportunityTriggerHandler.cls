public with sharing class OpportunityTriggerHandler 
{
    /*
    public static void recalculateOpportunityProductQuantity(Map<Id, Opportunity> newOpportunityMap, Map<Id, Opportunity> oldOpportunityMap)
    {
        List<String> opportunityIds = new List<String>();
        Opportunity newOpportunity;
        Opportunity oldOpportunity;
        for(String opportunityId : newOpportunityMap.keySet())
        {
            newOpportunity = newOpportunityMap.get(opportunityId);
            oldOpportunity = oldOpportunityMap.get(opportunityId);

            if(newOpportunity.NumberOfSites__c != oldOpportunity.NumberOfSites__c)
            {
                opportunityIds.add(opportunityId);
            }                
        }

        if(opportunityIds.size() > 0)
        {
            List<OpportunityLineItem> lineItems = 
                [select Opportunity.NumberOfSites__c, Hours_Info_Only__c, PricebookEntry.Product2.Hours__c
                 from OpportunityLineItem
                 where OpportunityId in :opportunityIds 
                 and (PricebookEntry.Product2.Family = 'Integration' or PricebookEntry.Product2.Family = 'Services')
                 and PricebookEntry.Product2.HoursEditable__c = false];

            if(lineItems.size() > 0)
            {
                for(OpportunityLineItem lineItem : lineItems)
                {
                    lineItem.Hours_Info_Only__c = calculateHoursInfo(lineItem.Opportunity.NumberOfSites__c, lineItem.PricebookEntry.Product2.Hours__c);
                }
                Database.update(lineItems, false);
            }
        }
    }
    */
    public static void recalculateOpportunityProductPrice(Map<Id, Opportunity> newOpportunityMap, Map<Id, Opportunity> oldOpportunityMap)
    {
        List<String> opportunityIds = new List<String>();
        Opportunity newOpportunity;
        Opportunity oldOpportunity;
        for(String opportunityId : newOpportunityMap.keySet())
        {
            newOpportunity = newOpportunityMap.get(opportunityId);
            oldOpportunity = oldOpportunityMap.get(opportunityId);

            if(newOpportunity.Total_Addressable_Revenue__c != oldOpportunity.Total_Addressable_Revenue__c)
            {
                opportunityIds.add(opportunityId);
            }                
        }

        if(opportunityIds.size() > 0)
        {
            List<OpportunityLineItem> lineItems = new List<OpportunityLineItem>();
            for(Opportunity opp : [select Total_Addressable_Revenue__c, NumberOfSites__c, CurrencyIsoCode,
                                    (select Id, UnitPrice, List_Price__c, Discount__c, Quantity,
                                            OpportunityId, PricebookEntryId, POC_Terms__c, Hours_Info_Only__c,
                                            PricebookEntry.UnitPrice, PricebookEntry.Product2Id,
                                            PricebookEntry.Product2.UseStandardPrice__c,
                                            PricebookEntry.Product2.Name,
                                            PricebookEntry.Product2.Family, 
                                            PricebookEntry.Product2.HoursEditable__c,
                                            PricebookEntry.Product2.Product_Sub_Category__c,
                                            PricebookEntry.Product2.ProductSubFamily__c,
                                            PricebookEntry.Product2.Hours__c,
                                            PricebookEntry.Product2.Integration_Rate__c
                                    from OpportunityLineItems
                                    order by PricebookEntry.Product2.Family,
                                            PricebookEntry.Product2.Product_Sub_Category__c,
                                            PricebookEntry.Product2.ProductSubFamily__c,
                                            PricebookEntry.Product2.Name)
                                from Opportunity where Id in :opportunityIds])
            
            {
                if(opp.OpportunityLineItems.size() > 0)
                {
                    PriceCalculator.calculatePrice(opp, opp.OpportunityLineItems);
                    lineItems.addAll(opp.OpportunityLineItems);
                }
            }  
            try
            {
                update lineItems;
            }
            catch(Exception ex)
            {
                system.debug(ex);
            }
        }
    }

    public static void setCSDirectorField(List<Opportunity> opportunities)
    {
        for(Opportunity opp : opportunities)
        {
            opp.CS_Director__c = opp.CSDirectorId__c;
        }        
    }

    /*
    private static Decimal calculateHoursInfo(Decimal numberOfSites, Decimal productHours)
    {
        if(productHours != null && numberOfSites != null && numberOfSites > 0)
        {
            return productHours * numberOfSites;
        }
        return productHours;     
    }
    */


    
    /*
    public static void sendApprovalRequest(Map<Id, Opportunity> newOpportunityMap, Map<Id, Opportunity> oldOpportunityMap)
    {
        List<String> opportunityIds = new List<String>();
        Opportunity newOpportunity;
        Opportunity oldOpportunity;
        for(String opportunityId : newOpportunityMap.keySet())
        {
            newOpportunity = newOpportunityMap.get(opportunityId);
            oldOpportunity = oldOpportunityMap.get(opportunityId);

            if(newOpportunity.ApprovalSubmitted__c && !oldOpportunity.ApprovalSubmitted__c)
            {
                opportunityIds.add(opportunityId);
            }                
        }

        if(opportunityIds.size() > 0)
        {
            List<EmailTemplate> templates = [select Id from EmailTemplate where DeveloperName = 'Opportunity_Approval_Submit_Approval'];
            if(templates.size() > 0)
            {
                sendApprovalRequest(opportunityIds, templates[0].Id);
            }            
        }
    }

    private static void sendApprovalRequest(List<String> opportunityIds, String templateId)
    {
        List<User> recipients = getRecipients();
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        For(Opportunity opp : [select Id, Owner.CSDirector__c from Opportunity where Id in :opportunityIds])
        {
            if(opp.Owner.CSDirector__c != null)
            {
                mails.add(initSingleMessage(opp.Id, opp.Owner.CSDirector__c, templateId));
            }            
            for(User u : recipients)
            {
                mails.add(initSingleMessage(opp.Id, u.Id, templateId));
            }
        }

        if(mails.size() > 0)
        {
            Messaging.sendEmail(mails);
        }
    }

    private static List<User> getRecipients()
    {
        return [select Id from User where UserRoleId in (select Id from UserRole where DeveloperName = 'VP_Client_and_Customer_Services')];
    }

    private static Messaging.SingleEmailMessage initSingleMessage(String opportunityId, String userId, String templateId)
    {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setTargetObjectId(userId);
        mail.setTemplateId(templateId);
        mail.setWhatId(opportunityId);
        mail.setSaveAsActivity(false);
        return mail;        
    }
    */
}