public class testBatchable implements Database.Batchable<sObject>{
	public Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
         
        String query = 'select id,Timestamp__c from TestQble__c';
        return Database.getQueryLocator(query);
    }    
    
    public void execute(Database.BatchableContext BC, List<TestQble__c> lstInp) {
        
       List<TestQble__c> lstUpd = new List<TestQble__c>();      
        
        for(TestQble__c obj:lstInp){
            Datetime dt = Datetime.Now();
            //obj.name = 'T'+ obj.name;
        	obj.Timestamp__c = dt; 
            lstUpd.add(obj);
            //system.debug('It came inside for');
        }        
        
        if(lstUpd!=null && lstUpd.size()>0){
            system.debug('It came inside update');
            update lstUpd;
        } 
        
        List<Account> lstAcc = new List<Account>();
        for(integer i=0;i<lstUpd.size();i++){
            lstAcc.add(new Account(name='Acctest'+i));    
        }
        insert lstAcc;
    }   
     
    public void finish(Database.BatchableContext BC) {
        // execute any post-processing operations like sending email
    }
}

/*
 testBatchable myBatchObject = new testBatchable(); 
Id batchId = Database.executeBatch(myBatchObject);
system.debug(batchId);
*/