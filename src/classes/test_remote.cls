// 
@isTest
private class test_remote {

    static testMethod void myUnitTest() {
        // TO DO: implement unit test
        Account accountinstance=new Account();
        accountinstance.name = 'newTestAccount';
        insert C;
        Contact contactinstance = new Contact();
        contactInstance.AccountId = accountInstance.id;
        insert contactInstance;

         test.StartTest();
         controller_accountContact controllerobject=new controller_accountContact();
         controllerobject.searchString = 'newTestAccount';
         list<Contact> conlist = [select id 
                                       ,Lastname 
                                 from  Contact
                                 where AccountId like accountInstance.id];
         @isRemoteTest
         controllerobject.removecontact(conlist.id);
         test.StoptTest();
 
        system.assertEquals(0,conlist.size);
        
        
    }
}