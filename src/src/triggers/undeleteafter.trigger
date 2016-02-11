trigger undeleteafter on Account (after undelete) {
	
	 for(Account a: trigger.new)
	 {
	 	system.debug('trigger.new contents on afterundelete are' +a);
	 }
	
	
	 map<id,account> oldaccountmap=trigger.newmap;
	 set<id> oldaccountsetid=oldaccountmap.keyset();
	 list<Account> oldaccount_list=[select id, name, Industry from account where Id IN : oldaccountsetid];
	 for(Account itteratoraccount : oldaccount_list)
	 {
	 	system.debug('trigger.newmap contents   on afterundelete are'+itteratoraccount);
	 }		
    //throws exception with old and old map
    //the new newmap are loaded with the undeleted record.
}