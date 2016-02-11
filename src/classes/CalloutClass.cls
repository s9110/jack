global class CalloutClass {
        global static HttpResponse getInfoFromExternalService() {
                 HttpRequest req = new HttpRequest();
                 req.setEndpoint('https://www.googleapis.com/customsearch/v1?key=AIzaSyAIUl6zIHbDK38FM5mbIHkL5qxjIBF_S6s&cx=011445309941056220928:h2rgmt38r2g&q=parachute');
                 req.setMethod('GET');
                 Http h = new Http();
                 HttpResponse res = h.send(req);
                 return res;
            }
        
    }