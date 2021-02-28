public class QuoteService 
{
    public static list<QuoteLineItem> getQuoteLineItems(String quoteId)
    {
        List<QuoteLineItem> quoteLineItems = [select Id, Name__c,TotalPrice, UnitPrice, Quantity, ListPrice, Subtotal,Discount__c, 
                                              Discount,Hours_Info_Only__c, List_Price__c,POC_Terms__c,
                                              PricebookEntry.Product2.Name, PricebookEntry.Product2Id, PricebookEntry.Product2.Hours__c,
                                              PricebookEntry.Product2.Family, PricebookEntry.Product2.Product_Sub_Category__c 
                                              from QuoteLineItem where QuoteId = :quoteId order by PricebookEntry.Product2.Family, 
                                              PricebookEntry.Product2.Product_Sub_Category__c, PricebookEntry.Product2.Name];
        return quoteLineItems;        
    }
}