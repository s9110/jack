trigger Updateafter on Account (after update) {
	
	
	//trigger.new contains the id of the  added list or record of the account object
	for(Account a: trigger.new)
	 {
	 	system.debug('trigger.new contents on afterupdate are' +a);
	 	
	 }
	  for(Account a: trigger.old)
	 {
	 	system.debug('trigger.old contents on afterupdate are' +a);
	 }	
	 
	 
	 //trigger.newmap contains the map of newly updated records through the dml operations or dataloader
	 map<id,account> accountmap=trigger.newmap;
	 for(Id id : accountmap.keyset())
	 {
	 	system.debug('trigger.newmap contents   on afterupdate are'+id);
	 	
	 }	
	  map<id,account> accountoldmap=trigger.oldmap;
	 for(Id id : accountoldmap.keyset())
	 {
	 	system.debug('trigger.oldmap contents   on afterupdate are'+id);
	 }	
    //after update also gets gets executed after before update trigger
}