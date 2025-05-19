public class PDTest1 {
    class MyException extends Exception {}    
        public static Account aQuery(){            
            Account theAccount;
            try{
                system.debug('Querying Accounts');
                theAccount = [select id from Account where createdDate > TODAY];
            }
            catch(MyException ex){
                system.debug('Custom Exception.');
            }
            catch(QueryException ex){
                system.debug('Query Exception.');
            }
            finally{
                system.debug('Done');
            }
            return theAccount;
        }
    }