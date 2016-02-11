@isTest
private class test_casetrigger {
  string amount='50000';
    static testMethod void myUnitTest() {
        // TO DO: implement unit test
        // list<Case> caselist=new list<Case>();
        Sales_header__c  salesobject1=new Sales_header__c();
        salesobject1.Name='bill1';
        salesobject1.Total_Amount__c= 50000;
        salesobject1.Status__c='Open';
        salesobject1.Ship_to_Street__c='sbroada';
        salesobject1.Ship_to_Postal_code__c='235545';
        salesobject1.Ship_to_state__c='maharashtre';
        salesobject1.Ship_to_city__c='pune';
        salesobject1.Bill_to_Street__c='jm road';
        salesobject1.Bill_to_state__c='maharashtre';
        salesobject1.Bill_to_Postal_Code__c='235545';
        salesobject1.Bill_to_city__c='pune';
        salesobject1.Account__c='0012800000CLtUk';
        salesobject1.Contact__c='0032800000ApSLq';
        salesobject1.EFT_lookup__c='a0J28000000Vng3';
        test.startTest();
        insert  salesobject1;
        test.stopTest();
        list <case> caselist = [
                              SELECT Id
                                    , Status
                                    , Type
                                    , OwnerId 
                             FROM CASE ];
        system.debug(caselist);
    }
}