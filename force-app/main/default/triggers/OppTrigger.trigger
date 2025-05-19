trigger OppTrigger  on Opportunity (before insert) {
    Book__c bk = new  Book__c();
    //bk.addError('Error from Opp');
    bk.Name = 'test book200';
    try{
        List<Opportunity> Opp = trigger.new;
        Database.saveResult result = database.insert(bk);
        //Opp[0].addError('this error is from Opp');        
        //system.debug('final result-> '+result);       
    }
    catch(Exception e){
        if(e.getMessage().contains('Error from book')){
            for (Opportunity a : Trigger.new) {
                a.addError('This error is from Books');    
            }
       }
        
    }
    
    
}