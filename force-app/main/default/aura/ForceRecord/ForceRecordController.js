({
    init: function(component, event, helper) {
        // Check user's profile 
        console.log('in init');
    },
	fireChildCreate: function(component, event, helper) {
        const rid = component.get("v.recordId");
         console.log('inside create method');
        var createRecordEvent = $A.get("e.force:createRecord");
        createRecordEvent.setParams({
            "entityApiName": "Child__c",
            "defaultFieldValues": {
            	//'Parent__c' : 'a1RKY000000oLmp2AE',
                //'ParentRecord__c':'a1RKY000000oLmp2AE',
                'Parent__c' : rid,
                'ParentRecord__c':rid
    } 
        });
        console.log('before event firing');
        createRecordEvent.fire();
    }
})