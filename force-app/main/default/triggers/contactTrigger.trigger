trigger contactTrigger on Contact (before Insert) {
    try{
        //List<Contact> obj = Trigger.new;
        Opportunity Opp = new Opportunity();
        Opp.Name = 'test opp';
        //Opp.CloseDate = '1/30/2021';
        Opp.StageName = 'Prospecting';
        Database.Insert(Opp);
    }catch(Exception ex){
         if(ex.getMessage().contains('This error is from Books')){
            for (Contact a : Trigger.new) {
                a.addError('This error is from Opportunity');    
            }
       }   
    }
}