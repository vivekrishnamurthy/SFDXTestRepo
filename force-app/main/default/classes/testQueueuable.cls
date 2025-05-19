public class testQueueuable implements Queueable {

    //Datetime dt = Datetime.Now();
    
    public void execute(QueueableContext context) {
    	List<TestQble__c> lstUpd = new List<TestQble__c>();
        
        
        for(TestQble__c obj:[select id,Timestamp__c from TestQble__c]){
            Datetime dt = Datetime.Now();
        	obj.Timestamp__c = dt;
            //obj.MMID__c = 'abc';
            lstUpd.add(obj);
        }        
        
        if(lstUpd!=null && lstUpd.size()>0){
            update lstUpd;
        }        
	}
}

/*
List<TestQble__c> lstIns = new List<TestQble__c>();             
for(integer i=0;i<1000;i++){
	TestQble__c obj = new TestQble__c();
    obj.Name = 'Test'+i;
    lstIns.add(obj);
}
Insert lstIns;

ID jobID = System.enqueueJob(new testQueueuable());
system.debug(jobID);

List<TestQble__c> lstDel = [select id from TestQble__c];
Delete lstDel; 

*/