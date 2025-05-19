public with sharing class fileUploadHandler {
    @AuraEnabled(cacheable=true)
    public static Map<String,String> getResultsMap(){
        Map<string,string> mp = new Map<string,string>();
        mp.put('key1','value1');
        mp.put('key2','value2');

        return mp;
    }
}