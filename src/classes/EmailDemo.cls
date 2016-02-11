/**
 * Email services are automated processes that use Apex classes
 * to process the contents, headers, and attachments of inbound
 * email.
 */
global class EmailDemo implements Messaging.InboundEmailHandler {
    public list<Contact> contactList;
    public  list<Detail__c> detailList;
    public Detail__c detailinstance;
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
        String dummy= EncodingUtil.urlEncode(email.plainTextBody, 'UTF-8');
        string body1 = dummy.replace('%2B','+');
        String body = body1.replace('%0A','');
                     contactList = [SELECT Id
                                    FROM Contact
                                    WHERE Email =:envelope.fromAddress];
                     detailList = [SELECT id 
                                         , Body__c 
                                      FROM Detail__c
                                      WHERE Body__c =: body];
        list<ContactDetail__c> contactquery = [SELECT ContactId__c
                                                     , EmailId__c
                                               FROM ContactDetail__c 
                                               WHERE EmailId__r.Body__c =:body];
        //string b= email.plainTextBody;
        //system.debug('the querystring is '+b);
        system.debug('***************plain text body format'+body);
        system.debug(contactquery.size());
        system.debug(detailList);
            try{
                 if( contactList.isEmpty() && detailList.isEmpty() ) {
                        
                        Contact ContactInstance=new Contact();
                        ContactInstance.Lastname = email.fromName;
                        ContactInstance.Email= envelope.fromAddress;
                        contactList.add(ContactInstance);
                        insert contactList;
                        
                        Detail__c detailinstance=new Detail__c();
                        detailinstance.name = email.subject;
                        detailinstance.Subject__c= email.subject;
                        detailinstance.Body__c = body;
                        insert detailinstance;
                        
                        ContactDetail__c contactDetailInstance = new ContactDetail__c();
                        contactDetailInstance.ContactId__c = contactList[0].id;
                        contactDetailInstance.EmailId__c = detailinstance.id;
                        insert contactDetailInstance;
                    }else if((!contactList.isEmpty()) && (detailList.isEmpty())) {
                        //system.debug(contactList.size());
                        //system.debug(detailList.size());
                        Detail__c detailinstance=new Detail__c();
                        detailinstance.name = email.subject;
                        detailinstance.Subject__c= email.subject;
                        detailinstance.Body__c = body;
                        insert detailinstance;
                        ContactDetail__c contactDetailInstance2 = new ContactDetail__c();
                        contactDetailInstance2.ContactId__c = contactList[0].id;
                        contactDetailInstance2.EmailId__c = detailinstance.id;
                        insert contactDetailInstance2;
                 }else {
                        ContactDetail__c contactDetailInstance2 = new ContactDetail__c();
                        contactDetailInstance2.ContactId__c = contactList[0].id;
                        system.debug(contactList[0].id);
                        contactDetailInstance2.EmailId__c = detailList[0].id;
                        system.debug(detailList[0].id);
                        insert contactDetailInstance2;
                 }
            }
            catch (Exception e) {
                System.debug('exception occured'+e);
            }
         return result;
    }
}