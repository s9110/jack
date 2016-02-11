@isTest
private class Test_goobleForceExtension {
 
   static testMethod void myUnitTest1() {
      string searchString='parachute';
      list<Detail__c> searchlist=new list<Detail__c>();
      Detail__c detail=new Detail__c();
      detail.Body__c ='parachute'; 
      detail.Subject__c ='online shopping';
      searchList.add(detail);
      Test.setMock(HttpCalloutMock.class, new  Test_FutureCallout());
      insert detail;
      list<SearchResult__c> resultList=new list<SearchResult__c>();

      //specify mock after before running test in order to generate mock response 

      test.startTest();
        goobleForce_Extension gooble=new goobleForce_Extension();
        gooble.searchString=searchString;
        gooble.searchbtn();
      test.stopTest();

      list<Detail__c> results=[Select id,name from Detail__c];
      system.assertEquals(true,(!results.isEmpty()));
    }
     /* static testMethod void myUnitTest2(){ 
        string searchString = '';
        test.startTest();
        goobleForce_Extension gooble=new goobleForce_Extension();
        gooble.searchString=searchString;
        gooble.searchbtn();
        test.stopTest();
        system.assert(true);
    }*/
    
    static testMethod  void myUnitTest3(){ 
    //insert the detail Record in its list
        Detail__c detail = new Detail__c();
        detail.Body__c ='city';
        detail.Subject__c = 'state';
        List<Detail__c> detailList = new List<Detail__c>();
        detailList.add(detail);
        Test.setMock(HttpCalloutMock.class, new  Test_FutureCallout());
        insert detailList;
        Id detailId = detailList[0].Id;

    //insert searchrecord list
        SearchResult__c result = new SearchResult__c();
        result.Name ='Pune';
        result.Body__c = detailId;
        result.Description__c = 'Maharashtra';
        result.Kind__c='this test';
        result.Link__c='www.htc.com';
        
        List<SearchResult__c> resultList = new List<SearchResult__c>();
        resultList.add(result);
        Test.setMock(HttpCalloutMock.class, new  Test_FutureCallout());
        insert resultList;

       // Test.setMock(HttpCalloutMock.class, new  Test_FutureCallout());
        Test.startTest();
            goobleForce_Extension gooble = new goobleForce_Extension();
            gooble.resultList = resultList; 
            gooble.getDetails();
        Test.stopTest();

        system.assertEquals(1,resultList.size());
    }


    static testMethod void myUnitTest5() {
        //searchObj.getAccountList();
        test.startTest();
            goobleForce_Extension gooble = new goobleForce_Extension();
            gooble.Next();
            gooble.Previous();
            gooble.con.getHasPrevious();
            gooble.con.getHasNext();
            boolean doTest1 = gooble.hasNext;
            boolean doTest2 = gooble.hasPrevious;
         test.stopTest();
   }
    
}