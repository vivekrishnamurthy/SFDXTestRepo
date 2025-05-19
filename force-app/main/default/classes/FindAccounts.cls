public class FindAccounts {
    
    public string accname{get;set;}
    Sobject[] objlst = new list<Sobject>();
    public string res{get;set;}
    //public string[] acclst = new list<string>();
    public List<Account> acclst{get;set;}
    
    public void insertBooks()
    {
        Expense__c bk = new Expense__c();
        bk.Amount__c = 2000;
        insert(bk);
        
        string str = 'Sales,Force';
        List<string> splt = str.split(',');
        System.debug(splt[0]);
        System.debug(splt[1]);
    }
    
    public void searchacc()
    {
        try
        {
            //string query = 'select id from account where name=\'' + accname + '\'';
        string query = 'select name from account where name like ' + '\'%'  + accname + '%' + '\'';
        //string query = 'select name from account where name like \'%big%\'';
        objlst = database.query(query) ;
        //system.debug(objlst);
        string str = string.valueOf(objlst.get(0));
        res = str.substringBetween('Account:{Name=',',');
      	acclst = [select name from Account];
        //for(integer i=0;i<objlst.size();i++)
        //{
          //  string stracc = string.valueOf(objlst.get(i));
        	//acclst.add(stracc.substringBetween('Account:{Name=',','));
            
        //}
        //res = str;
        }
       catch(Dmlexception e)
       {
           System.Debug('There was an exception ' + e.getMessage());
       }
        
    }

    
}