@isTest
public class test_searchcontroller {

    static testMethod void TestSearchController() {

        // #TODO : controller finds the records in the four objects 
        // create test data
        List<Account> accountList = new List<Account>();
        List<Opportunity> OpportunityList = new List<Opportunity>();
        List<Contact> contactList = new List<Contact>();
        List<Lead> leadList = new List<Lead>();
         
        for(Integer iTemp=0; iTemp<=3; iTemp++) {
            Account accountObj = new Account();
            accountObj.name = 'sheetal' + itemp;
            accountObj.AccountNumber = '52137';
            accountObj.AccountSource = 'humtydumpty';
            // accountObj.CleanStatus = '2015';
            accountList.add(accountObj);
            
            Contact contactObj = new Contact();
            contactObj.Lastname = 'sheetal' + itemp;
            contactObj.Highest_Qualification__c = 'bsc';
            contactObj.Expecienced__c = 'two years';
            contactObj.Email ='urname@gmail.com';
            contactList.add(contactObj);
            
            Opportunity opportunityObj = new Opportunity();
            opportunityObj.Name = 'sheetal' + itemp;
            opportunityObj.CloseDate = Date.today();
            opportunityObj.StageName = 'Needs Analysis';
            opportunityObj.MainCompetitors__c = 'urname.domainname.com';
            OpportunityList.add(opportunityObj);
            
            Lead leadObj = new Lead();
            leadObj.LastName = 'sheetal' + itemp;
            leadObj.Company = '2/12/2013';
            leadObj.Status = 'Closed-Not Converted';
            leadList.add(leadObj);
        }
        insert accountList;
        insert contactList;
        insert opportunitylist;
        insert leadlist;
        Id[] fixedSearchResults = new Id[4];
         fixedSearchResults[0] = accountList[0].id;
         fixedSearchResults[1] = contactList[0].id;
         fixedSearchResults[2] = OpportunityList[0].id;
         fixedSearchResults[3] = leadList[0].id;
         Test.SetFixedSearchResults(fixedSearchResults);
         List < List < SObject >> searchList = new List < List < SObject >> (); 
        // insert test data
        Test.StartTest();
        
        SearchController controllerinstance = new SearchController();
        controllerinstance.sname='sheetal';
        controllerinstance.searchStr1=controllerinstance.sname ;

        controllerinstance.search();
        Test.StopTest();
        System.assertEquals(4, controllerinstance.results.size());
        // assert if the size of the List is null
        List<Account> resultaccountlist = [
            SELECT Id
                 , Name
              FROM Account 
             WHERE Name LIKE 'sheetal*'
        ];
        //system.assert(1,resultaccountlist.size());
        System.assertEquals(accountlist.size(),resultaccountlist.size(),'assert pass');

        List<Contact> resultcontactlist = [
            SELECT Id
                 , Email
              FROM Contact
             WHERE Email LIKE 'urname.domainname.com'
        ]; 
        //system.assert(1,resultaccountlist.size());
        System.assertEquals(contactList.size(),resultcontactlist.size(),'assert pass');

        List<Opportunity> resultopportunitylist = [
            SELECT Id
                 , Name
              FROM Opportunity
             WHERE Name LIKE 'bigdeal*'
        ];
        System.assertEquals(OpportunityList.size(),resultopportunitylist.size(),'assert pass');

        List<Lead> resultleadlist = [
            SELECT Id
                 , Name
              FROM Lead
             WHERE LastName LIKE 'biglead*'
        ];
        System.assertEquals(leadList.size(),resultleadlist.size(),'assert pass');
        // asser for the required record inserted correctly
    }

}