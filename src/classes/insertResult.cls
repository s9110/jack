// this class wil be consumed by visulaforce page and webservice class 
public class insertResult {
    public static list<Detail__c> detailInstance=new list<Detail__c>();
    public static void insertResponse(jsonToApex JsonResponse, String body){
       // system.debug('body is '+body);
        String body1 = body.replace('%2B','+');
        //system.debug('*******************'+ body1);
        integer responseSize = JsonResponse.items.size();
        list<SearchResult__c> resultList = new list<SearchResult__c>();
         detailInstance = [SELECT Id
                                , Body__c
                           FROM Detail__c
                           WHERE Body__c =: body1];
        //system.debug('*******************'+detailInstance[0].Body__c);
        for(integer result=0; result < responseSize; result++ ) {
            //system.debug('******json response '+JsonResponse.items[result].formattedUrl); 
            SearchResult__c resultInstance = new  SearchResult__c();
            resultInstance.Body__c = detailInstance[0].id;
            resultInstance.Link__c = JsonResponse.items[result].formattedUrl;
            resultInstance.Description__c = JsonResponse.items[result].snippet;
            resultInstance.Kind__c = JsonResponse.items[result].kind;
            resultInstance.Title__c = JsonResponse.items[result].title;
            system.debug(JsonResponse.items[result].title);
            //resultInstance.Contact__c = contactList[0].Contact__c;
            resultList.add(resultInstance);
            system.debug('***********'+resultInstance.Title__c);
        } upsert resultList Link__c;
    }
}