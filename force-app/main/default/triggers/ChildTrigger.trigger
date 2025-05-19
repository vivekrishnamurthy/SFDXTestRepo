trigger ChildTrigger on Child__c (before insert) {
	List<Child__c> obj = trigger.new;
    system.debug('Text--> '+ obj[0].ParentRecord__c);
    system.debug('Lookup--> '+obj[0].Parent__c);
    if(obj[0].ParentRecord__c <> obj[0].Parent__c){
        obj[0].addError('The Parent has been modified!');
    }
}