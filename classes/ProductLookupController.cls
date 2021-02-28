public with sharing class ProductLookupController 
{
    public String SelectedCategory { get; set; }
    public String SelectedSubCategory { get; set; }
    public String Keyword { get; set; }
    private String currencyIsoCode;
    private String standardPricebookId;
    public ProductLookupController() 
    {       
        Keyword = '2.0';
        String opportunityId = Apexpages.currentPage().getParameters().get('id');
        currencyIsoCode = [select CurrencyIsoCode from opportunity where Id = :opportunityId].CurrencyIsoCode;
        if(Test.isRunningTest())
        {
            standardPricebookId = Test.getStandardPricebookId();
        }
        else
        {
            standardPricebookId = [select Id from Pricebook2 where IsStandard = true].Id;
        }        
    }

    public List<SelectOption> ProductCategoryOptions
    {
        get
        {
            Schema.DescribeFieldResult fieldDescribe = Product2.Family.getDescribe();            
            List<SelectOption> result = new List<SelectOption>();
            result.add(new SelectOption('', '--All--'));
            for(Schema.PicklistEntry entry : fieldDescribe.getPicklistValues())
            {
                result.add(new SelectOption(entry.getValue(), entry.getLabel()));
            }
            return result;
        }
    }

    public List<SelectOption> ProductSubCategoryOptions
    {
        get
        {
            Schema.DescribeFieldResult fieldDescribe = Product2.Product_Sub_Category__c.getDescribe();            
            List<SelectOption> result = new List<SelectOption>();
            result.add(new SelectOption('', '--All--'));
            for(Schema.PicklistEntry entry : fieldDescribe.getPicklistValues())
            {
                result.add(new SelectOption(entry.getValue(), entry.getLabel()));
            }
            return result;
        }
    }   

    public List<PricebookEntry> getPricebookEntries()
    {
        String queryString = 'select Id,Product2Id,Product2.Name,Product2.ProductCode,';
        queryString += 'Product2.Family,Product2.Product_Sub_Category__c';
        queryString += ' from PricebookEntry';
        queryString += ' where IsActive = true and Product2.Family != null';
        queryString += ' and Product2.Product_Sub_Category__c != null';
        queryString += ' and CurrencyIsoCode = :currencyIsoCode and Pricebook2Id = :standardPricebookId';
        if(String.isNotBlank(SelectedCategory))
        {
            queryString += ' and Product2.Family = :SelectedCategory';
        }
        if(String.isNotBlank(SelectedSubCategory))
        {
            queryString += ' and Product2.Product_Sub_Category__c = :SelectedSubCategory';
        }
        if(String.isNotBlank(Keyword) && Keyword.length() >= 2)
        {
            queryString += ' and (Product2.Name like \'%' + Keyword + '%\' or Product2.ProductCode like \'%' + Keyword + '%\')';
        }
        queryString += ' order by Product2.Family, Product2.Product_Sub_Category__c';
        system.debug(queryString);
        return Database.query(queryString);
    }
}