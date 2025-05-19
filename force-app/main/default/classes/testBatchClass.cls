public class testBatchClass implements Database.Batchable<SObject>,Database.Stateful{
    
    List<id> idLst = new List<id>();
    List<Parent__c> lstparent = new List<Parent__c>();
    
    public Database.QueryLocator start(Database.BatchableContext context) {
    	string query = 'select id,Name, Parent__c, run_date__c, Status__c, test_date_time__c from Child__c';
        return Database.getQueryLocator(query);    
    }
    
    public void execute(Database.BatchableContext context, List<Child__c> scope) {
        
        
        for(Child__c obj:scope){
        	Parent__c parent = new Parent__c();
            parent.Ref_Name__c = 'ParentRec'+String.Valueof(Integer.valueof((Math.random() * 100)));
            parent.run_date__c = Date.valueOf('2024-07-01');
            lstparent.add(parent);
        }
        
       /* Database.SaveResult[] srList = Database.insert(lstparent,true);
        for(Database.SaveResult res : srList){
             if(!res.isSuccess()){
                for(Database.Error err : res.getErrors()) {               
                  System.debug('The following error has occurred.'+err.getStatusCode() + ': ' + err.getMessage()); 
                }
             }else{
                 idLst.add(res.getId());
             }
        }*/

        
    }
    
    public void finish(Database.BatchableContext context) {
        List<Child__c> childLst = new List<Child__c>();
        Integer i = 0;
        
        Database.SaveResult[] srList = Database.insert(lstparent,true);
        for(Database.SaveResult res : srList){
             if(!res.isSuccess()){
                for(Database.Error err : res.getErrors()) {               
                  System.debug('The following error has occurred.'+err.getStatusCode() + ': ' + err.getMessage()); 
                }
             }else{
                 idLst.add(res.getId());
             }
        }
        
        for(Id key:idLst){
            i++;
            Child__c chld = new Child__c();
            chld.Parent__c = key;
            chld.run_date__c = Date.valueOf('2024-07-01');
            chld.ParentRecord__c = key;
            if(i!=5){
                chld.Status__c = 'Scheduled';
            }
            childLst.add(chld);
        }
        
        Database.SaveResult[] srList1 = Database.insert(childLst,true);
        for(Database.SaveResult res : srList1){
             if(!res.isSuccess()){
                for(Database.Error err : res.getErrors()) {               
                  System.debug('The following error has occurred.'+err.getStatusCode() + ': ' + err.getMessage()); 
                }
             }
        }
        
        //insert childLst;
    }
}