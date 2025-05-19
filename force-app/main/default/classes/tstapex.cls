public class tstapex {
    
    public void fun()
    {
        List<Schema.RecordTypeInfo> lst = Schema.getGlobalDescribe().get('Account').getDescribe().getRecordTypeInfos();
        System.debug(lst);
    }

}