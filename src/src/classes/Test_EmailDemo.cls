@isTest
private class Test_EmailDemo {
    static testMethod void myUnitTest() {
        // create a new email and envelope object
        Messaging.InboundEmail email = new Messaging.InboundEmail() ;
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();

        Messaging.InboundEmail emailnew = new Messaging.InboundEmail() ;
        Messaging.InboundEnvelope envexist = new Messaging.InboundEnvelope();

       // setup the data for the email
        email.subject = 'Test Job Applicant';
        email.fromName = 'FirstName LastName';
        email.plainTextBody = 'new text';
        env.fromAddress = 'someaddress210@email.com';


        Test.setMock(HttpCalloutMock.class, new  Test_FutureCallout());

        // call the email service class and test it with the data in the testMethod
        test.startTest();
        EmailDemo emailProcess = new EmailDemo();
        emailProcess.handleInboundEmail(email, env);
        emailProcess.handleInboundEmail(emailnew,envexist);
        test.stopTest();

        // query for the contact the email service created
        list<Contact> contact = [SELECT id
                                        , firstName
                                        , lastName
                                        , email 
                                FROM contact
                                WHERE email='someaddress210@email.com'];
      /* list<contact> contactnotexist=[SELECT id
                                             , firstName
                                             , lastName
                                             , email 
                                      FROM contact
                                      WHERE lastname='LastName'];*/
        //system.debug('**********Contact list is'+contactnotexist.size());
        System.assertEquals(contact[0].email,'someaddress210@email.com');
        
    }
        static testMethod void myUnitTest1() { 
        Messaging.InboundEmail email = new Messaging.InboundEmail() ;
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();
        
        Messaging.InboundEmail emailnew = new Messaging.InboundEmail() ;
        Messaging.InboundEnvelope envexist = new Messaging.InboundEnvelope();
        
        Contact conInstance = new Contact();
        conInstance.LastName = 'Sheetal';
        conInstance.Email = 'abc@domain.com';
        List<Contact> conList = new List<Contact>();
        conList.add(conInstance);
        insert conList;
        
        email.subject = 'Test Job Applicant';
        email.fromName = 'FirstName LastName';
        email.plainTextBody = 'new text';
        env.fromAddress = 'abc@domain.com';

        Detail__c detailInstance = new Detail__c(); 
        detailInstance.Body__c = 'abcd';
       detailInstance.Subject__c = 'sheetal';
       List<Detail__c> detailList=new List<Detail__c>(); 
        detailList.add(detailInstance);
        insert detailInstance;

        Test.setMock(HttpCalloutMock.class, new  Test_FutureCallout());
        test.startTest(); 
        EmailDemo emailProcess = new EmailDemo();
        emailProcess.contactList = conList;  
        emailProcess.detailinstance = detailInstance;  
        emailProcess.handleInboundEmail(email, env);
      //  emailProcess.handleInboundEmail(emailnew,envexist);
        test.stopTest();
        
        list<Contact> contactList=[select id ,email from contact where Email ='abc@domain.com'];
        system.assertEquals(1,contactList.size());
        }
}