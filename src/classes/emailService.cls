/**
 * Email services are automated processes that use Apex classes
 * to process the contents, headers, and attachments of inbound
 * email.
 */
global class emailService implements Messaging.InboundEmailHandler {

    global Messaging.InboundEmailResult handleInboundEmail( Messaging.InboundEmail email,
                                                            Messaging.InboundEnvelope envelope
                                                           ) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
       try{
        Contact ContactInstance=new Contact();
            ContactInstance.Lastname = 'details';
            ContactInstance.Email= envelope.fromAddress;
            insert ContactInstance;
            Detail__c detailinstance=new Detail__c();
            detailinstance.name = email.subject;
            detailinstance.Subject__c= email.subject;
            detailinstance.Body__c = email.plainTextBody;
            insert detailinstance;
       } catch(Exception e) 
       {
           system.debug('Exception has occured'+e);
       }
        return result;
    }
}