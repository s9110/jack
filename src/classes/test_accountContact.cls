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
@isTest(seeAllData=False)
Public class test_accountContact {

    static testMethod void myUnitTest() {
        // TO DO: implement unit test
        //create test data 
        Contact contactinstance=new Contact();
        contactinstance.LastName='abcd';
        contactinstance.Highest_Qualification__c='12';
        insert contactInstance;
        Contact contactinstance1=new Contact();
        contactinstance1.LastName='ibc';
        contactinstance1.Highest_Qualification__c = 'mca';
        insert contactInstance1;
        Contact contactinstance2=new Contact();
        contactinstance2.LastName='ibc';
        contactinstance2.Highest_Qualification__c = 'bca';
        insert contactInstance2;
        test.startTest();
        Alphasearch_controller search1=new Alphasearch_controller();
        search1.SearchVar='a';
        search1.display();
        test.StopTest();

        list<Contact> conlist = [SELECT lastname FROM contact];
        system.assertEquals(1,conlist.size());
        //system.assertEquals('a' , conlist.lastname);
        //for all contacts in the object.
        list<Contact> conatctlist = [SELECT id
                                           ,Lastname
                                      FROM contact];
       system.assertEquals(3,conatctlist.size());
    } 
}