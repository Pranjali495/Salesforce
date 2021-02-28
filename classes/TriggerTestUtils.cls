@isTest
public class TriggerTestUtils 
{
    @isTest
    static void testUserTrigger()
    {
        /* Create Test Data */
        Account newAccount = TestDataFactory.createAccount('Test Account');
        Database.insert(newAccount, false);

        Contact newContact = 
            TestDataFactory.createContact(newAccount.Id, 'Test', 'Contact', 'test@acme.com');
        Database.insert(newContact, false);

        Opportunity newOpp = 
            TestDataFactory.createOpportunity(newAccount.Id, 'Test Opportunity', '(SaaS) Lead - 10%', Date.today().addMonths(1), 'EUR');
            newOpp.Web_Online_Revenue__c = 2000000;
            newOpp.Web_Online_Perc_Addressable__c = 100;
            newOpp.Mobile_Revenue__c = 2000000;
            newOpp.Mobile_Addressable__c = 100;
            newOpp.NumberOfSites__c = 2;
        Database.insert(newOpp, false);

        User currentUser = [select CSDirector__c from User where Id = :UserInfo.getUserId()];
        Database.update(currentUser, false);

        List<User> users = [select Id from User where UserType = 'Standard' and IsActive = true and CSDirector__c = null limit 1];
        if(users.size() > 0)
        {
            currentUser.CSDirector__c = users[0].Id;
        }        
        Database.update(currentUser, false);        
    }


    @isTest
    static void testTaskTrigger()
    {
        /* Create Test Data */
        Account newAccount = TestDataFactory.createAccount('Test Account');
        Database.insert(newAccount, false);

        Contact newContact = 
            TestDataFactory.createContact(newAccount.Id, 'Test', 'Contact', 'test@acme.com');
        Database.insert(newContact, false);

        Opportunity newOpp = 
            TestDataFactory.createOpportunity(newAccount.Id, 'Test Opportunity', '(SaaS) Lead - 10%', Date.today().addMonths(1), 'EUR');
            newOpp.Web_Online_Revenue__c = 2000000;
            newOpp.Web_Online_Perc_Addressable__c = 100;
            newOpp.Mobile_Revenue__c = 2000000;
            newOpp.Mobile_Addressable__c = 100;
            newOpp.NumberOfSites__c = 2;
        Database.insert(newOpp, false);

        Attachment newAttachment = new Attachment(Name = 'Test.pdf', ParentId = newOpp.Id);
        newAttachment.Body = Blob.valueOf('Test');
        Database.insert(newAttachment, false);

        Task closedTask = new Task(OwnerId = UserInfo.getUserId(), WhatId = newOpp.Id);
        closedTask.Subject = 'Email: Test';
        closedTask.Status = 'Completed';
        closedTask.ActivityDate = Date.today();
        closedTask.Priority = 'Normal';
        closedTask.Type = 'Email';
        Database.insert(closedTask, false);
    }
}