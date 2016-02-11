trigger deletebefore on Account (before delete) {
	
    /*for(Account a: trigger.new)
	 {
	 	system.debug('trigger.new contents on beforedelete are' +a);
	 	
	 }*/
	  for(Account a: trigger.old)
	 {
	 	system.debug('trigger.old contents on beforedelete are' +a);
	 }
	 
	 
	 
	 /*map<id,account> newaccountmap=trigger.newmap;
	 set<id> newaccountsetid=newaccountmap.keyset();
	 list<Account> newaccount_list=[select id, name, Industry from account where Id IN : newaccountsetid];
	 for(Account itteratoraccount : newaccount_list)
	 {
	 	
	 	system.debug('trigger.newmap contents   on beforedelete are'+itteratoraccount);
	 }	*/
	 
	 map<id,account> oldaccountmap=trigger.oldmap;
	 set<id> oldaccountsetid=oldaccountmap.keyset();
	 list<Account> oldaccount_list=[select id, name, Industry from account where Id IN : oldaccountsetid];
	 for(Account itteratoraccount : oldaccount_list)
	 {
	 	system.debug('trigger.oldmap contents   on beforedelete are'+itteratoraccount);
	 }		
}