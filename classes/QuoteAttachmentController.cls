public with sharing class QuoteAttachmentController {
    public Opportunity opp{set;get;}
    public Quote quote{set;get;}
    public boolean Succeeded{set;get;}
    public boolean FieldRequired{set;get;}
    public String ErrorFieldRequired{set;get;}
    public QuoteAttachmentController(ApexPages.StandardController controller) 
    {
        try
        {
            controller.addFields(new String[]{'Id','Name','OwnerId','Account.Name','SyncedQuoteId'});
        }
        catch(Exception e){}
        opp = (Opportunity)controller.getRecord();

        List<Quote> quotes = [select Id, AccountId, Name, Show_List_Price__c, Show_Sales_Price__c, Show_Discount__c, Show_Hours__c, Show_Cumulative_Discount__c, Show_Special_Terms__c, Show_Cumulative_List_Price__c, Show_Cumulative_Sales_Price__c,ContactId, ExpirationDate from Quote where Id = :opp.SyncedQuoteId];
        if(quotes.size() == 0){
            quotes = [select Id, AccountId, Name, Show_List_Price__c, Show_Sales_Price__c, Show_Discount__c, Show_Hours__c, Show_Cumulative_Discount__c, Show_Special_Terms__c, Show_Cumulative_List_Price__c, Show_Cumulative_Sales_Price__c,ContactId, ExpirationDate from Quote where OpportunityId = :opp.Id order by CreatedDate desc limit 1];  
        }
        if(quotes.size() > 0)
        {
            quote = quotes[0];
        }
        Succeeded = false;
    }

    public List<SelectOption> getRelatedContactOptions()
    {
        List<SelectOption> options = new List<SelectOption>();
        if(quote != null && quote.AccountId != null)
        {
            for(Contact contact : [select Id, Name from Contact where AccountId = :quote.AccountId order by Name])
            {
                options.add(new SelectOption(contact.Id, contact.Name));
            }
        }
        return options;
    }
    
    public PageReference attachQuote()
    {   
        if(FieldRequired)
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, ErrorFieldRequired)); 
            FieldRequired = false;            
        }
        else
        {
             PageReference pdfPage = new PageReference('/apex/QuoteDocument');
            pdfPage.getParameters().put('id',quote.Id);
            Blob pdfBlob;
            if(Test.isRunningTest())
            {
                pdfBlob = Blob.valueOf('Test Quote PDF');
            }
            else
            {
                pdfBlob = pdfPage.getContent();
            }
            String attachName = 'Quotation for ' + opp.Account.Name +' '+quote.Name + '.pdf';
            Attachment attachment = new Attachment(ParentId = opp.Id,Name = attachName,Body = pdfBlob);
            insert attachment;
            Succeeded = true;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info, 'Document generated.')); 
        }    
        return null;
    }
    public PageReference updateQuote()
    {
        FieldRequired = false;
        if(quote.ContactId == null)
        {
            FieldRequired = true;
            ErrorFieldRequired = 'Contact Name is required';
            return null;
        }
        else if(quote.ExpirationDate == null)
        {
            FieldRequired = true;
            ErrorFieldRequired =  'ExpriationDate is required';
            return null;
        }
        update quote;
        return null;
    }
}