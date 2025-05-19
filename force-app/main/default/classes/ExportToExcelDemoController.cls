public with sharing class ExportToExcelDemoController { 
    
    public class ContactWrapper{  
      @AuraEnabled  
      public string contactName;  
      @AuraEnabled  
      public string contactEmail;  
      public ContactWrapper(Contact contactObj){  
        this.contactName = contactObj.Name;  
        this.contactEmail = contactObj.Email;  
      } 
       
    }  
    @AuraEnabled  
    //public static List<ContactWrapper> getContacts(){  
    public static Map<string,string> getContacts(){  
      List<ContactWrapper> contactWrapperList = new List<ContactWrapper>();  
      Map<string,string> mapRes = new Map<string,string>();
      for(Contact cwObj : [select id, Name, Email from Contact limit 5]){  
        // contactWrapperList.add(new ContactWrapper(cwObj));  
        mapRes.put(cwObj.Name,cwObj.Email);
      }  
      //return contactWrapperList;  
      return mapRes;
    }  
  }