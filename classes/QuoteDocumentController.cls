public with sharing class QuoteDocumentController {
    public Quote quote{set;get;}
    public List<QuoteLineItem> quoteLineItems{set;get;}

    public QuoteDocumentController(ApexPages.StandardController controller) 
    {
     
        try
        {
            controller.addFields(new String[]{'Id', 'Name', 'Phone', 'Email', 'Subtotal', 'Build__c','Discount','ExpirationDate','QuoteNumber','Total_Discount__c','CreatedDate',
                  'Contact.Name','Contact.MailingCity','Contact.MailingCountry','Contact.MailingPostalCode','Contact.MailingStreet',
                  'Show_List_Price__c','Show_Sales_price__c','Show_Discount__c','Show_Special_Terms__c','Show_Cumulative_List_Price__c','Show_Cumulative_Discount__c','Show_Cumulative_Sales_Price__c','Show_Hours__c',
                  'Opportunity.Owner.Name','Opportunity.Owner.Email','Opportunity.Owner.Phone','Opportunity.OwnerId','Opportunity.CurrencyIsoCode'});
        }
        catch(Exception e){}

        quote =  (Quote) controller.getRecord();
        quoteLineItems = QuoteService.getQuoteLineItems(quote.Id);
    }
}