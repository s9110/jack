@isTest(SeeAllData=False)
private class test_batchexample1 {

    static testMethod void myUnitTest() {
        Account accountinstance = new Account();
        accountinstance.Name = 'sheetal';
        insert accountinstance;
        
        Contact contactinstance = new Contact();
        contactinstance.Lastname ='smaug';
        contactinstance.Highest_Qualification__c='bsc';
        contactinstance.accountId = accountinstance.id;
        contactinstance.Email='sheetal.sangtani@eternussolutions.com';
        insert contactinstance;

        Opportunity Opportunityinstance= new Opportunity();
        Opportunityinstance.AccountId = accountinstance.id;
        Opportunityinstance.Amount=500;
        Opportunityinstance.CloseDate=date.newInstance(2015,2,2);
        Opportunityinstance.StageName='Closed Won';
        Opportunityinstance.Name =' kkk';
        insert Opportunityinstance;

        Opportunity Opportunityinstance2= new Opportunity();
        Opportunityinstance2.AccountId = accountinstance.id;
        Opportunityinstance2.Amount=500;
        Opportunityinstance2.CloseDate=date.newInstance(2015,2,2);
        Opportunityinstance2.StageName='Closed Won';
        Opportunityinstance2.Name =' kkkl';
        insert Opportunityinstance2;

        batchexample1 batch = new batchexample1();
        Test.StartTest();
            batchexample1 b = new batchexample1();
            database.executebatch(b);
        Test.stopTest(); 
        list<Account> accountlist=[SELECT id
                                         , Name
                                  FROM Account];
       list<Contact> ccountlist=[SELECT id
                                  FROM Contact];
        list<Opportunity> opportunitylist=[SELECT id
                                                 , name
                                                 , amount
                                                 , Stagename
                                                 , Account.Primary_Contact__c 
                                                 , AccountId 
                                          FROM  Opportunity 
                                          WHERE Accountid IN :accountlist AND StageName='Closed Won'
                                            ];
        // system.debug(opportunitylist.size());                                   
        //decimal amount = accountlist[0].Amount + accountlist[1].Amount;
        System.assertEquals(true, 1 == accountlist.size(),'the list size is same');
        System.assertEquals(true, 3 == opportunitylist.size(),'the list size is same');
        
    }
}