trigger UpdateBefore on Account (before update) {
	 
	for(Account a: trigger.new)
	 {
	 	system.debug('trigger.new contents on beforeupdate are' +a);
	 }	
	 for(Account a: trigger.old)
	 {
	 	system.debug('trigger.old contents on beforeupdate are' +a);
	 }	
	 
	 
	 //trigger.newmap and trigger.oldmap
	 map<id,account> accountmap=trigger.newmap;
	 for(Id id : accountmap.keyset())
	 {
	 	system.debug('trigger.newmap contents   on beforeupdate are'+id);
	 }	
	  map<id,account> accountoldmap=trigger.oldmap;
	 for(Id id : accountoldmap.keyset())
	 {
	 	system.debug('trigger.oldmap contents   on beforeupdate are'+id);
	 }	
    
}