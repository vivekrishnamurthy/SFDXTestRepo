public with sharing class newApexclass {
    public newApexclass() {

        

    }

    public void fun()
    {
        List<Account> lst = new List<Account>();
        String objectName = string.valueof(lst.getSObjectType());
        System.Debug(objectName);
        
        string str = 'Select Id, Name, PMP_Offering_Id__c, PMP_Partner_Offering_Resource_URL_Txt__c, PMP_Partner_Offering_Image__c,PMP_Resource_Type_Nm__c FROM PMP_Partner_Offering_Resource__c WHERE PMP_Partner_Offering_Image__c=NULL and PMP_Partner_Offering_Resource_URL_Txt__c <> NULL' 
            + 'and PMP_Resource_Type_Nm__c = \'Image\'';
          System.debug(str);
    }
    
    public void objType()
    {
        List<sObject> lst = new List<sObject>();
        List<Campaign> lst1 = new List<Campaign>();
        
        lst1 = (List<Campaign>)lst;
    }
}