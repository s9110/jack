@isTest
private class Test_insertResult {
    static testMethod void myUnitTest() {
         Test.setMock(HttpCalloutMock.class, new  Test_FutureCallout());
          list<Detail__c>  detailList = new list<Detail__c>();
          Detail__c detailInstance=new Detail__c();
          detailInstance.Body__c = 'parachute';
          detailInstance.Subject__c='abscg';
          detailList.add(detailInstance);
          insert detailList;
          //system.debug('********************'+detailList);
        test.startTest();
        //insertResult.insertResponse(JsonResponse,detailInstance[0].Body__c );
        insertResult.detailInstance=detailList;
        test.stopTest();
    }
}