@isTest
public class test_bestpractise {

     public static void contactTest() {
        
        Contact contactinstance = new Contact();
        contactinstance.LastName = 'sheetal';
        contactinstance.Highest_Qualification__c = 'bsc';
        contactinstance.Email = 'abc@contact.com';

        Account accountinstance = new Account();
        accountinstance.name= 'contact.com';
        insert accountinstance;

        test.startTest();
        insert contactinstance;
        test.stopTest();
        list<Account> Acclist=[Select id,Name from account where name ='contact.com'];
        
        system.assertEquals( true,acclist.isEmpty());
        
    }
}