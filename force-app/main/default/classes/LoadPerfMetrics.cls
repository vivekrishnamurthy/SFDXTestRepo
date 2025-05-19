public class LoadPerfMetrics {


    @InvocableMethod(label='Load Metrics' description='Load performance metrics')
    public static void UpdateMetrics(List<SBQQ__Quote__c> qt)
    {
        String quoteId = qt[0].id;
        System.debug('quoteId-> '+  quoteId);
        //quoteId = ApexPages.currentPage().getParameters().get('id');
        
        SBQQ__Quote__c quotetoUpdate = [select id,Performance_Metrics__c from SBQQ__Quote__c where id=: quoteId];
        
        quotetoUpdate.Performance_Metrics__c = '1000';
        
        update quotetoUpdate;        
       
        
    }
    
    @AuraEnabled(cacheable=true)
    public static string returnstring()
    {
       return 'This is a message from APEX';
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Wrapper> getmetadata(Id recordId,string objectInfo)
    {
        List<Wrapper> lst = new list<Wrapper>();
        Wrapper mdata1 = new Wrapper();
        Wrapper mdata2 = new Wrapper();
        Wrapper mdata3 = new Wrapper();
        string label = '';
        
        mdata1.Category = string.valueOf(recordId);
        mdata1.Type = objectInfo;
        mdata1.ColumnName = string.valueOf(recordId);
        mdata1.SortOrder = '3';
        
        mdata2.Category = 'Online';
        mdata2.Type = 'Type2';
        //mdata2.ColumnName = 'No of KPI';
        //mdata2.ColumnName = string.valueOf(lstpfr[i].get(string.valueOf(lstpfr[i].getSObjectType().getDescribe().fields.getMap().get(mdata.fieldAPI))));
        Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Map<string,Schema.SObjectField> fieldMap = schemaMap.get(objectInfo).getDescribe().fields.getMap();
        for(Schema.SObjectField sfield : fieldMap.Values())
        {
            schema.describefieldresult dfield = sfield.getDescribe();
            //system.debug('#######' + dfield );
            //Pair field = new Pair();
            //field.key = dfield.getname();
            string name = dfield.getname();
             
            //system.debug('#######4444' + field.key);
            //field.val = dfield.getType () + ' : ' + dfield.getLabel ();
            //lstfieldname.add(field);
            if(name == 'book__c')
            {
                label = dfield.getLabel();
                break;
            }
            	   
        }
        mdata2.ColumnName = label;        
        mdata2.SortOrder = '1';

        mdata3.Category = string.valueOf(recordId);
        mdata3.Type = objectInfo;
        mdata3.ColumnName = string.valueOf(recordId);
        mdata3.SortOrder = '2';
        
        lst.add(mdata1);
        lst.add(mdata2);
        lst.add(mdata3);
        
        return lst;
       // return 'This is a message from APEX';
    }
    
    public class Wrapper
    {
        @AuraEnabled
        public string Category;
        @AuraEnabled
        public string Type;
        @AuraEnabled
        public string ColumnName;
        @AuraEnabled
        public string SortOrder;
    }
}