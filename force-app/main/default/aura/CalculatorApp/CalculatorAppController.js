({
    Addition : function(component, event, helper) {
        //component.set('v.Output',parseInt(v.Input1)+parseInt(v.Input2))
        alert('in fun');
        var lwccomp = component.find('mylwc');
        if (lwccomp != null){
            alert('here');
            var values = lwccomp.saveMethod();
           // if (values == null){
                alert(values);
                //alert(mergedObj.Core_MDF_Type_of_Page_txt__c);
               	//alert(mergedObj.Core_MDF_Estimated_Ad_Size_nbr__c);
                //alert(mergedObj.Core_MDF_Magazine_Newspaper_txt__c);
           // }
        }
    }
    
    
})