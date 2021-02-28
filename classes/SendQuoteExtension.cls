public with sharing class SendQuoteExtension 
{
    public Quote PrimaryQuote { get; set; }
    public Quote TempQuote { get; set; }
    public OutboundEmail Email { get; set; }
    public Boolean Success { get; set; }        
    
    public SendQuoteExtension(ApexPages.StandardController controller) 
    {
        Opportunity opp = [select Id, SyncedQuoteID, Owner.Email from Opportunity where Id = :controller.getId()];
        PrimaryQuote = getPrimaryQuote(opp);

        TempQuote = new Quote();
        Email = new OutboundEmail();
        Email.Subject = 'Quote for ' + PrimaryQuote.Account.Name;
        if(opp.Owner.Email != null)
        {
            Email.CCAddr = opp.Owner.Email;
        }
        Success = false;
    }    
    
    public PageReference send()
    {
        Email.TargetObjectId = PrimaryQuote.ContactId;

        if(TempQuote.ContactId != null)
        {
            List<Contact> contacts = [select Id, Name, Email from Contact where Email != null and Id = :TempQuote.ContactId];
            if(contacts.size() == 0)
            {
                String errorMsg = 'Error: ' + contacts[0].Name + 'doesn\'t have an email addresss.';
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Warning, errorMsg));
                return null;
            }
            else
            {
                Email.ContactEmail = contacts[0].Email;
            }
        }
        try
        {
            sendEmail();
            Success = true;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info, 'Email has been sent out.'));
        }        
        catch(Exception ex)
        {
            ApexPages.addMessages(ex);
        }
        return null;
    }

    private void sendEmail()
    {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setTargetObjectId(Email.TargetObjectId);
        if(Email.CCAddresses.size() > 0)
        {
            mail.setCcAddresses(Email.CCAddresses);
        }
        mail.setSubject(Email.Subject);
        mail.setPlainTextBody(Email.Body);
        mail.setUseSignature(true);
        mail.setFileAttachments(getFileAttachments());        
        mail.setWhatId(PrimaryQuote.OpportunityId);
        mail.setSaveAsActivity(true);        
        Messaging.sendEmail(new Messaging.SingleemailMessage[]{mail});
    }

    public class OutboundEmail
    {
        public String TargetObjectId { get; set; }
        public String ContactEmail { get; set; }        
        public String CCAddr { get; set; }
        public List<String> CCAddresses
        {
            get
            {
                List<String> result = new List<String>();
                if(ContactEmail != null)
                {
                    result.add(ContactEmail);
                }
                if(String.isNotBlank(CCAddr))
                {
                    result.addAll(CCAddr.split('[,;]'));
                }
                return result;
            }
        }
        public String Subject { get; set; }
        public String Body { get; set; }        
    }

    private Quote getPrimaryQuote(Opportunity opp)
    {
        List<Quote> quotes = [select Name, Account.Name, ContactId, OpportunityId from Quote where Id = :opp.SyncedQuoteID];
        if(quotes.size() == 0)
        {
            quotes = [select Name, Account.Name, ContactId, OpportunityId from Quote where OpportunityId = :opp.Id order by CreatedDate desc limit 1];
        }
        if(quotes.size() > 0)
        {
            return quotes[0];
        }
        return null;
    }   

    private List<Messaging.EmailFileAttachment> getFileAttachments()
    {
        PageReference quoteDoument = new PageReference('/apex/QuoteDocument?id=' + PrimaryQuote.Id);
        Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
        if(Test.isRunningTest())
        {
            attachment.setBody(Blob.valueOf('Quote Document'));
        }
        else
        {
            attachment.setBody(quoteDoument.getContent());
        }        
        attachment.setContentType('application/pdf');
        String fileName = PrimaryQuote.Name + '.pdf';        
        attachment.setFileName(fileName);
        attachment.setInline(false);
        return new List<Messaging.EmailFileAttachment>{attachment};
    }
}