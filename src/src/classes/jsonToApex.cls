public with sharing class jsonToApex {

    public String kind {get;set;} 
    public List<cls_items> items {get;set;}

    public class cls_items {
        public String kind; //customsearch#result
        public String title;    //Sherlock (TV Series 2010– ) - IMDb
        public String link; //http://www.imdb.com/title/tt1475582/
        public String snippet;  //Created by Mark Gatiss, Steven Moffat. With Benedict Cumberbatch, Martin 
        public String formattedUrl; //www.imdb.com/title/tt1475582/

        public cls_items(JSONParser parser) {
            while (parser.nextToken() != JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != JSONToken.VALUE_NULL) {
                        if (text == 'kind') {
                            kind = parser.getText();
                        } else if (text == 'title') {
                            title = parser.getText();
                        } 
                        else if (text == 'link') {
                            link = parser.getText();
                        } 
                         else if (text == 'formattedUrl') {
                            link = parser.getText();
                        } 
                        else if (text == 'snippet') {
                            snippet = parser.getText();
                        } 
                          else {
                            System.debug(LoggingLevel.WARN, 'Items consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }

    public jsonToApex() {
        }

    public jsonToApex(JSONParser parser) {
        while (parser.nextToken() != JSONToken.END_OBJECT) {
            if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                String text = parser.getText();
                system.debug(text);
                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                    if (text == 'kind') {
                        kind = parser.getText();
                    } else if (text == 'items') {
                        items = new List<cls_items>();
                        while (parser.nextToken() != JSONToken.END_ARRAY) {
                            items.add(new cls_items(parser));
                        }
                    } else {
                        System.debug(LoggingLevel.WARN, 'Root consuming unrecognized property: '+text);
                        consumeObject(parser);
                    }
                }
            }
        }
    }

    public static void consumeObject(JSONParser parser) {
        Integer depth = 0;
        do {
            JSONToken curr = parser.getCurrentToken();
            if (curr == JSONToken.START_OBJECT || 
                curr == JSONToken.START_ARRAY) {
                depth++;
            } else if (curr == JSONToken.END_OBJECT ||
                curr == JSONToken.END_ARRAY) {
                depth--;
            }
        } while (depth > 0 && parser.nextToken() != null);
    }
    
     public static jsonToApex parse(String json) {
        return new jsonToApex(System.JSON.createParser(json));
    }
}