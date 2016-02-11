@isTest
private class Test_CalloutClass {
   static testMethod void myUnitTest() {

        Test.setMock(HttpCalloutMock.class, new  Test_FutureCallout());
        Detail__c detail= new Detail__c();
        detail.Body__c='parachute';
        detail.Subject__c='test class';

        test.startTest();
        insert detail;
        test.stopTest();
        list<SearchResult__c> searchlist = [SELECT Body__c
                                                  , Link__c
                                                  , Description__c
                                                  , Kind__c
                                            FROM SearchResult__c 
                                            WHERE Body__r.Body__c = 'parachute'];
        system.debug(searchlist);
        system.debug('************* searchlist size is '+searchlist.size());
      // system.assertEquals(0,searchlist.size());
    }
}