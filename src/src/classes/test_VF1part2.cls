@isTest
private class test_VF1part2 {

    static testMethod void myUnitTest() {
        List < Account > AccountList = new List < Account > ();
        List < Contact > ContactList = new List < Contact > ();
        List < Opportunity > OppList = new List < Opportunity > ();
        Account accountObject = new Account(Name = 'Sheetal Test');
        insert accountObject;
        Contact contactObject = new Contact(LastName = 'Contact Sheetal ', AccountId = accountObject.Id);
        insert contactObject;
        Opportunity oppObject = new Opportunity(Name = 'Opportunity', AccountId = accountObject.Id, CloseDate = date.today(), StageName = 'Prospecting');
        insert oppObject;
        List < Account > accList = new List < Account > ();

        Test.startTest();
            String accountId;
            String conID;
            ApexPages.StandardController controller  = new ApexPages.StandardController(accountObject);
            VisualForce1part2 visualTest = new VisualForce1part2(controller);
            visualTest.accountId = accountObject.Id;
            visualTest.accountList = AccountList;
            visualTest.contactList = ContactList; 
            visualTest.opportunityList = OppList; 
            visualTest.getDetails();
            //VisualForce1part2.getdel(contactObject.Id);
            Test.stopTest();
   
        //AccountList = [SELECT Id, Name from Account];
        //ContactList = [SELECT Id, Name, Contact.Account.Name from Contact];
        system.assertEquals(true, visualTest.ContactList!= null || !visualTest.ContactList.isEmpty(), 'The list is not empty');
        OppList = [SELECT Id, Name, Opportunity.Account.Name from Opportunity];
        //system.assertEquals(AccountList[0].Name, OppList[0].Account.Name);

    }

   /* static testMethod void DeleteTest() {
        Test.startTest();
        Account accountObject = new Account(Name = 'Remote_Account');
        insert accountObject;
        Contact contactObject = new Contact(LastName = 'Remote_Contact', AccountId = accountObject.Id);
        insert contactObject;
        String conID;
        VisualForce1part2 remote_test = new VisualForce1part2(cs);
        remote_test.accountId = accountObject.Id;
        remote_test.conID = contactObject.Id;
        system.debug(conID);
        VisualForce1part2.getdel(contactObject.Id);
        Test.stopTest();
        //system.assertEquals(0,);
    }*/
}