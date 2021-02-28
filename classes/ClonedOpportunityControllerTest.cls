@isTest
public class ClonedOpportunityControllerTest {
	@isTest
	public static void testClonedOpportunity()
    {
        Account act = new Account(Name='Test Account', Sub_Region__c = 'UK');
        insert act;
        Opportunity opp = new Opportunity(Name='TestOpp', AccountId=act.Id, StageName='(SaaS) RR on short list - 60%', CloseDate=Date.today());
        insert opp;
        Id pricebookId = Test.getStandardPricebookId();
        Product2 prod = new Product2(Name='test Prodcut', ProductCode='Pro-X', isActive=true, Family = 'License', Product_Sub_Category__c ='Recommend ');
        insert prod;
        PricebookEntry pbEntry = new PricebookEntry(Pricebook2Id=pricebookId, Product2Id=prod.Id, UnitPrice=100.00, IsActive=true);
        insert pbEntry;
        OpportunityLineItem oli = new OpportunityLineItem(OpportunityId=opp.Id, Quantity=5, PricebookEntryId=pbEntry.Id);
        insert oli;
        apexPages.currentPage().getparameters().put('id' , opp.Id);
        apexPages.currentPage().getparameters().put('clonePro' , '1');
        CloneOpportunityController coc = new CloneOpportunityController(null);
		coc.jumpToEdit();
    }
}