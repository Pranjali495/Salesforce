public class UpdateProjectsController {

    public Boolean jobStarted { public get; private set; }
    
    public UpdateProjectsController() {
    
        jobStarted = false;
    }
    
    public PageReference startJob() {
        
        Database.executeBatch(new BatchUpdateProjects(BatchUpdateProjects.BATCH_TYPE_ALL), BatchUpdateProjects.BATCH_SIZE);
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Job started.'));
        jobStarted = true;
        return null;
    }
}