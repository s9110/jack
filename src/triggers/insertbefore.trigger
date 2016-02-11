// trigger to print the contents of trigger.new list on before insert trigger

trigger insertbefore on Account (before insert) {
	 
	 // itterate over the type of contents the trigger.new list holds
	 //--trigger.new DOESNOT contains id i.e the record is in before commit stage--//
	 for(Account a: trigger.new)
	 {
	 	system.debug('trigger.new contents on beforeinsert are' +a);
	 	
	 }	
	 /*( for(Account a: trigger.newmap)
	 {
	 	system.debug('trigger.newmap contents   on beforeinsert are' +a);
	 	does not support because map contains <id,account> since id is not available on before insert event
	 }	*/
    
}