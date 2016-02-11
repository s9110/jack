public class handler_triggerEmailHandler {
    
    public void getBodySearch(list<Detail__c> detailLists) {
         String body;
        Detail__c detailInstance = new Detail__c();
        map<id,Detail__c> searchMap = new map<id, Detail__c>();
        searchMap.putAll(detailLists);
        detailInstance = searchMap.get(detailLists[0].id);
        body = detailInstance.Body__c;
        goobleResponse.doGet(body);
    } 
}