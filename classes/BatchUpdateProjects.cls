global with sharing class BatchUpdateProjects implements Database.Batchable<sObject>, Database.Stateful {

	public final static List<String> BATCH_TYPE_ALL = new List<String>{
        Schema.SObjectType.pse__Milestone__c.getName(),
        Schema.SObjectType.pse__Miscellaneous_Adjustment__c.getName(),
        Schema.SObjectType.pse__Proj__c.getName(),
        Schema.SObjectType.pse__Timecard__c.getName()
    };
    public final static Integer BATCH_SIZE = 100;
    
    private String objectOfBatch;
	private List<String> batchesToRun;
    
    global BatchUpdateProjects() {
        
        objectOfBatch = null;
		batchesToRun = new List<String>();
    }
    
    /* Uncomment if/when needed
    global BatchUpdateProjects(String objectOfBatch) {
		
		this();
		this.objectOfBatch = objectOfBatch;
	}
	*/
    
	global BatchUpdateProjects(List<String> batchesToRun) {
		
		this();
		this.batchesToRun = batchesToRun;
		if (!batchesToRun.isEmpty()) {
			objectOfBatch = batchesToRun.remove(0);
		}
	}
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
    
        return Database.getQueryLocator('SELECT Id FROM ' + objectOfBatch);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> objects) {
        
        Database.update(objects, false);
    }
    
    global void finish(Database.BatchableContext BC) {
        
        if (batchesToRun != null && !batchesToRun.isEmpty()) {
			Database.executeBatch(new BatchUpdateProjects(batchesToRun), BATCH_SIZE);
		}
    }
}