trigger HelloWorldTrigger on Book__c (after insert,before update) 
{
    if(Trigger.isBefore && Trigger.isUpdate){
        Book__c[] books = trigger.new;
        books[0].Count__c = books[0].Count__c + 1;
        books[0].Parent_Account__c = '001KY0000032NozYAE';
        System.Debug('Updated from Trigger');
    }
    
    if(Trigger.isInsert && Trigger.isAfter){
        Book__c[] books = trigger.new;
    
    
        //books = trigger.new;
        //books[0].addError('Error from book');       
        //Integer i = 1/0;
    
       //books[0].addError('this is error');
       
    
    //Book__c[] books = trigger.new;
    //MyHelloWorld.ApplyDiscount(books);
    //books[0].addError('There is an error');
    }
    
}