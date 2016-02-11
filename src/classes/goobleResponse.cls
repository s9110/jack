public class goobleResponse {
    @future (callout=true) 
    public static void doGet(String requestBody) {
       // encode the given string in order to process
            String body = EncodingUtil.urlEncode(requestBody, 'UTF-8');
            System.debug(body);
            Http h = new Http();
            HttpRequest req = new HttpRequest();
            req.setHeader('Content-Type','application/json');
            req.setHeader('accept','application/json');
            req.setEndpoint('https://www.googleapis.com/customsearch/v1?key=AIzaSyAIUl6zIHbDK38FM5mbIHkL5qxjIBF_S6s&cx=011445309941056220928:h2rgmt38r2g&q='+body);
            //system.debug(req);
            req.setMethod('GET');
            req.setTimeout(60000);
            HttpResponse res = h.send(req); // during test respond method is called 
            String response = res.getBody();
            try {
                // parser to parse the json response 
                JSONParser parser = JSON.createParser(res.getBody());
                jsonToApex JsonResponse = new jsonToApex(); 
                JsonResponse = (jsonToApex)JSON.deserialize(response,jsonToApex.class);
                System.debug('JSon Response'+JsonResponse);
                integer responseSize = JsonResponse.items.size();
                //system.debug('the size of list is '+responseSize);
                //insertResult insertInstance=new insertResult();
                insertResult.insertResponse(JsonResponse,body); 
            }
             catch(Exception e) {
                system.debug(''+e);
            }
    }
}