@istest
global class  Test_FutureCallout implements HttpCalloutMock {
    global static HTTPResponse respond(HTTPRequest req){
       HttpResponse res = new HttpResponse();
       res.setHeader('Content-Type', 'application/json');
       res.setBody('{\"kind\":\"customsearch#result\",\"items\":[{\"kind\":\"customsearch#result\",\"title\":\"EDUCATION\",\"link\": \"http://www.jason.org/\",\"snippet\": \"Year\"}]}\n');
       //res.setBody('{"kind": "customsearch#result","title": "Parachute","htmlTitle": "\u003cb\u003eParachute\u003c/b\u003e","link": "http://www.bassfiles.net/parachute.swf","displayLink": "www.bassfiles.net","formattedUrl": "www.bassfiles.net/parachute.swf","htmlFormattedUrl": "www.bassfiles.net/\u003cb\u003eparachute\u003c/b\u003e.swf"}');
       res.setStatusCode(200);
       String response = res.getBody();
       JSONParser parser = JSON.createParser(res.getBody());
       jsonToApex JsonResponse = new jsonToApex(parser); 
      
       return res; 
    }
}