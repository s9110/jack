trigger trigger_emailDetail on Detail__c (after insert) {
    
        handler_triggerEmailHandler emailHandler = new handler_triggerEmailHandler();
        emailHandler.getBodySearch(trigger.new);
    
}