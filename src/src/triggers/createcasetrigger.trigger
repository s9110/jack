trigger createcasetrigger on Sales_header__c ( after insert, before update) {
    handler_triggercreatecase objectofclass=new handler_triggercreatecase();
    objectofclass.salescheck(trigger.new);
}