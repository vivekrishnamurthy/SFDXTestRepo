global class UpdateObj implements Database.Batchable<sObject>{
	
    //global string queryActive = 'select Site from Account';
    global string queryActive;
    string type;
    Map<Id,string> mapObj = new Map<Id,string>();
    
    global UpdateObj(string btchtype)
    {
        type = btchtype;
        //type = 'Account';
    }
    
    
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        queryActive = queryGenerator(type);
        System.debug(queryActive);
        return Database.getQueryLocator(queryActive);
    }
    
    public string queryGenerator(string type)
    {
       if(type.equalsIgnoreCase('Account'))
        {
            return 'select Id,Site from Account';
        }
        
        //return 'select Site from Account';
        
        return 'select Name from Expense__c';
    }
    
    //global void execute(Database.BatchableContext bc, List<Account> obj)
    
  global void execute(Database.BatchableContext bc, List<sObject> obj)  
  {
      
      String objectName = string.valueof(obj.getSObjectType());
      List<Account> fnllst = (List<Account>)obj;  
            
      if(objectName.equalsIgnoreCase('account'))
      {
          List<Account> acclst = (List<Account>)obj;   
          
          for(Account act:acclst)
          {
              act.Site = 'MNG';
              mapObj.put(act.Id,act.Site);
               
          }
          
          	update acclst;
      }
      else if(objectName.equalsIgnoreCase('Expense__c'))
      {
          List<Expense__c> booklst = (List<Expense__c>)obj;  
          List<string> Names;
          
          for(Expense__c exp:booklst)
          {
              Names.add(exp.Name);
          }
          
          
          
          for(Expense__c book:booklst)
          {
              book.Name = 'Disp';
          }
          	update booklst;
      }
                 
          update obj;
      
      
		//List<string> ls = new List<string>();      
      	 // for(Id ide:mapObj.keySet())
         // {
              //ls.add(ide);
         //     System.debug(mapObj.get(ide));
         // }
      
       
          for(Account act:fnllst)
          {
              if(mapObj.containsKey(act.Id))
              act.Site = mapObj.get(act.Id);
               
          }
      
      		update fnllst;
    	
  }
    
  /*  global void execute(Database.BatchableContext bc, List<Account> obj)
    {
		try
        {
            if(type == 'acct')
            {
                for(Account act:obj)
                {
                    act.Site = 'MNG';
                }
              
            	update obj;
            }
             else if(type == 'book')
            {
                for(Book__c bk:obj)
                {
                    
                }
            } 
            
        }
        catch(Exception ex)
                {
                	System.debug('***Exception occurred while processing' + ex.getmessage()); 
                }
            
        
    } */
    
    global void finish(Database.BatchableContext bc)
    {
        System.debug('Batch complete');
    }
    
}