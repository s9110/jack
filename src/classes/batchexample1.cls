/*Description * The Primary contact associated with an account needs to know which all are the 
                 closed won opportunities for his account per day.
               * Create a process which will run everyday in the midnight & collect all the Closed
                 won opportunities of that account in a day & send an email to Primary Contact.
               * The email body should contain the Opportunity Name & it's respective amount with 
                 the aggregated amount in the end.*/



global class batchexample1 implements Database.Batchable <sObject> ,database.stateful {
    public map <id,String > AccountIDprimaryEmailmap = new map<id,String >();  
    public map<id,list<Opportunity>> accountOpportunitymap = new map<id,list<Opportunity>>();
    double AggregateAmount=0;
   // string opportunityName;
    map<string,decimal> nameAmount=new  map<string,decimal>();

    global Database.QueryLocator start( Database.BatchableContext batchableContext) {
      return database.getquerylocator('SELECT Id'+
                                            ', Name'+
                                            ',Primary_Contact__r.Email'+
                                      'FROM Account'+
                                      'WHERE Primary_Contact__c != null');
    }

    global void execute (Database.BatchableContext batchableContext
                                                   ,list <SObject> batchlist ) {
        list <Account> listAccount = new list<Account>();
        for(Sobject s: batchlist) {
            Account accountinstance = new Account();
            accountinstance = (Account)s;
            listAccount.add(accountinstance); 
            AccountIDprimaryEmailmap.put(accountinstance.Id, accountinstance.Primary_Contact__r.Email);
        }
    // map to get opportunities related to account in a list
        list<opportunity> listOpportunity=[SELECT id
                                                , name
                                                , amount
                                                , Stagename
                                                , Account.Primary_Contact__c
                                                , AccountId 
                                           FROM opportunity
                                           WHERE Accountid IN :listAccount AND StageName='Closed Won'];
        /*system.debug(listOpportunity.size());
        system.debug(listOpportunity);*/

    //insert the list of opportunity to its corresponding account
        for(Opportunity opportunity: listOpportunity) {
            if(accountOpportunitymap.containsKey(opportunity.AccountId)) {
                accountOpportunitymap.get(opportunity.AccountId).add(opportunity);
                system.debug(accountOpportunitymap);
            }
            else {
              accountOpportunitymap.put(opportunity.AccountId,new list<Opportunity>{opportunity});
            } System.debug(accountOpportunitymap);
        }
    }

    global void finish(Database.BatchableContext batchableContext) {
        if(Test.isRunningTest() == true) {
            return;
        }
        Messaging.SingleEmailMessage mail= new Messaging.SingleEmailMessage();
        set <id> keys=accountOpportunitymap.keySet();
        system.debug(keys.size());
        for(Id accountkey :accountOpportunitymap.keyset()){
            for(Opportunity opportunity : accountOpportunitymap.get(accountkey)) {
                 //string opportunityName = nameAmount;
                 nameAmount.put(opportunity.Name,opportunity.amount);
                 AggregateAmount = AggregateAmount+opportunity.amount;
               }
            }
            mail.setToAddresses(new string[]{'sheetal.sangtani@eternussolutions.com'});
            mail.setSubject('opportunities for account ');
            mail.setPlainTextBody('total amount is' + '\n total amount' +AggregateAmount);
            mail.setPlainTextBody('list of opportunity with their amount is '+nameAmount);
            Messaging.sendEmail(new Messaging.SingleEmailMessage []{mail}); 
    }
}
