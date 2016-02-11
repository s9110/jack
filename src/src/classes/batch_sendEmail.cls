global class batch_sendEmail  implements Database.Batchable <sObject>,Database.Stateful {
        @TestVisible static Integer emailLimits;
    
    public list<ContactDetail__c> contactdetailList = new list<ContactDetail__c>();
    string query = 'Select ContactId__c'+
                               ' , EmailId__c'+
                          ' FROM ContactDetail__c';
    global Database.QueryLocator start( Database.BatchableContext batchableContext) {
       //  system.debug('Query => '+query);
         return database.getquerylocator(query);
    }

    global void execute ( Database.BatchableContext batchableContext, list <SObject> batchlist ) {
       for(Sobject sc : batchlist) {
            ContactDetail__c junction=new ContactDetail__c();
            junction = (ContactDetail__c)sc;
            contactdetailList.add(junction);
        }
   }

    global void finish(Database.BatchableContext batchableContext) {
        if(Test.isRunningTest() == true) {
            return;
        }
        list< Messaging.SingleEmailMessage> emaillist = new list< Messaging.SingleEmailMessage>();
        Id templateId = [select id, name from EmailTemplate where developername = 'Results'].id;
        for(ContactDetail__c itterator : contactdetailList) {
           Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
           //system.debug(templateId);
           email.setTargetObjectId(itterator.ContactId__c);
           system.debug(itterator.ContactId__c);
           email.setWhatId(+itterator.EmailId__c);
           email.setTemplateId(templateId);
           system.debug(''+itterator.ContactId__c); 
           emaillist.add(email);
        }
         Messaging.sendEmail(emaillist);
    }
}