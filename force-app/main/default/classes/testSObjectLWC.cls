public class testSObjectLWC {
	@AuraEnabled(cacheable=true)
    public static string getOppDetails(Opportunity op){
        System.Debug('Opp Details: '+op.Name);
        return 'Result from LWC-> '+op.Name;
    }
}