// afterinsert trigger to print the contents of the trigger.new list
trigger InsertAfter on Account (after insert) {
    TriggerSetting__c instance =TriggerSetting__c.getInstance();
    if(instance.Insertafter__c){
	
	// itterate over the type of contents the trigger.new list holds
	// trigger.new contains the id of the  added list or record of the account object
	// i.e the record is commit 
	 for(Account a: trigger.new) {
	 	system.debug('trigger.new contents on afterinsert are' +a);
	 }
	// trigger.newmap contains the map of newly added records through the dml operations or dataloader
	//new map contains id, sobject . 
	map<id,account> accountmap=trigger.newmap;
	for(Id id : accountmap.keyset())
	 {
	 	system.debug('trigger.newmap contents   on beforeinsert are'+id);
	 	
	 }	
    }

}