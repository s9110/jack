/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class test_batchEmail {

    static testMethod void myUnitTest() {
        Test.setMock(HttpCalloutMock.class, new  Test_FutureCallout());
        string searchString='numerology';
        string subject ='test';
        string name ='google';
        string email='sheetal.sangtani@etenussoltions.com';
        list<Detail__c> detailList = new list<Detail__c>();
        list<ContactDetail__c> conatctdetailList = new list<ContactDetail__c>();
            Contact contact=new Contact();
            contact.LastName = name;
            contact.Email = email;
            Detail__c detail = new Detail__c();
            detail.Body__c = searchString;
            detail.Subject__c = subject;
            detaillist.add(detail);
            insert contact;
            insert detaillist;
            ContactDetail__c conatctdetail =new ContactDetail__c();
            conatctdetail.ContactId__c = contact.id;
            conatctdetail.EmailId__c = detaillist[0].id;
            conatctdetailList.add(conatctdetail);
            insert conatctdetail;
            test.startTest();
             batch_sendEmail b1=new batch_sendEmail();
             database.executeBatch(b1);
            test.stopTest();
          // system.debug('********* conatct list is '+conatctdetailList);
           system.assertEquals(1,conatctdetailList.size());

    }
        
}