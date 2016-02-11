@istest
private class test_cloneOpportunity {

    static  testMethod void  cloneOpportunity() {
        //create test data
        string test1 = 'new instance';
        list<Opportunity> opportunitylist = new list<Opportunity>();
        Opportunity opportunityInstance = new Opportunity();
        opportunityInstance.name = 'new instance';
        opportunityInstance.StageName='Prospecting';
        opportunityInstance.CloseDate=date.today();
        
        opportunitylist.add(opportunityInstance);
        system.debug(opportunitylist);
        
        test.startTest();
        insert opportunitylist;
        test.stopTest();
        
         list<Opportunity> resultopportunitylist=[select id,name from opportunity where name='new instance'];
         system.assertEquals( 2 ,resultopportunitylist.size());
         list<Opportunity> opplist=[select id,name from opportunity where name='new instance'];
         system.assertEquals(opplist[0].name,'new instance');
        
        //assertions 
        
        
     
     }
    
    
    
}