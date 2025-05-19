public class test {
   
   public List<string> getAccount()
   {
        String [] accname = new List<String>();
           		
        for(Account acc: [select name from Account])
        {
        	string name = acc.Name;
        	if(name.contains('Big'))
            	accname.Add(name);
        }
       
       return accname;
   }
  
    
   public Object add(integer a, integer b,string type)
   {
       if(type == 'Integer')
           return a+b;
       else if(type == 'Double')
           return double.valueOf(a+b);
       else 
           return 1300l + a;
   }
    
   public object getdate(string type)
   {
       blob b = blob.valueOf('abcd');
       if(type == 'date')
         return date.today();
       else if(type == 'datetime')
      	 return datetime.now();
       else
         return b;
   }
    
   public String CreateNewAccount(String accname)
   {
       Account acc = new Account();
       acc.Name = accname;
       acc.BillingCity = 'Vegas';
       
       try
       {
           insert acc;
       }
       catch(Dmlexception e)
       {
           return 'There was an exception ' + e.getMessage();
       }
       
       return 'Account successfully created!';
   }
    
  public list<String> getId(string objname)
  {
      String[] idlst = new list<String>();
      Sobject[] objlst = new list<Sobject>();
      
      for(schema.SObjectType obj: schema.getGlobalDescribe().values())
      {
        if(obj.getdescribe().getName() == objname)
        {
            objlst = database.query('select Id from ' + objname);
           
            for(integer i=0;i<objlst.size();i++)
            {
                String str = string.valueOf(objlst.get(i));
                //idlst.add(str);
                idlst.add(str.substringBetween('Account:{id=','}'));
                //String str = 'Account ID:{abc}';
                //str.substringBetween('Account ID:{','}');
                
            }
            
            break;
        }
      }
      
      
      if(objlst.size() == 0)
         System.debug('No such object found');
      
      return idlst;
  }

   //public list<Integer> whileloop(integer cnt)
   public list<id> whileloop()
   {
       integer i = 0;
       id[] idlst = new list<id>();
       //integer[] intlst = new list<Integer>();
       
       for(Opportunity opp:[SELECT AccountId FROM Opportunity where ownerId in
			(SELECT Id FROM User where Name like '%vivek%')])
       {
           idlst.add(opp.AccountId);
       }
       
       return idlst;
           
       //while(i<cnt)
       //{
        //   intlst.add(i*10);
        //   i++;
      // }
       
       //System.debug(intlst.size());
       //return intlst;
   }
}