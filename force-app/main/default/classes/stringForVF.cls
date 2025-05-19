public class stringForVF {    
    public string myString{
        get{
            if(myString==null){
               myString = 'a'; 
            }
            return myString;
        }private set;                
    }
    
    public string getMyString(){
        return 'getMyString';
    }
    
    public string getStringMethod(){
        if(myString==null){
            myString='b';
        }
        return myString;
    }
    
 /*   public string StringMethod{
        get{
            StringMethod = 'c';
            return StringMethod;
        }
        private set;
    } */
}