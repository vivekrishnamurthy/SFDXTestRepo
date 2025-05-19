global without sharing class SchUpdateObj implements Schedulable {
    
   string btchtype;
    
   global SchUpdateObj(string type)
   {
       btchtype = type;
   }

   global void execute(SchedulableContext sch)
    {
        //string query1 = 'select Site from Account';
        //string query2 = 'select Name from Expense__c';
        
                        
        /*UpdateObj batch = new UpdateObj();
        batch.queryActive = query1;
        Database.executeBatch(batch, 5);*/
        
        UpdateObj batch = new UpdateObj(btchtype);
        Database.executeBatch(batch, 5);
    }
    
        
}