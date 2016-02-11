public with sharing class trial {
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
    
    public String kind {get;set;} 
    public List<Items> items {get;set;} 
    
    public trial() {
        
    }
    
    public trial(JSONParser parser) {
        while (parser.nextToken() != JSONToken.END_OBJECT) {
            if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                String text = parser.getText();
                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                    if (text == 'kind') {
                        kind = parser.getText();
                    } else if (text == 'items') {
                        items = new List<Items>();
                        while (parser.nextToken() != JSONToken.END_ARRAY) {
                            items.add(new Items(parser));
                        }
                    } else {
                        System.debug(LoggingLevel.WARN, 'Root consuming unrecognized property: '+text);
                        consumeObject(parser);
                    }
                }
            }
        }
    }

    
    public class Items {
        public String kind {get;set;} 
        public String title {get;set;} 
        public String htmlTitle {get;set;} 
        public String link {get;set;} 
        public String displayLink {get;set;} 
        public String snippet {get;set;} 
        public String htmlSnippet {get;set;} 
        public String cacheId {get;set;} 
        public String formattedUrl {get;set;} 
        public String htmlFormattedUrl {get;set;} 
         

        public Items(JSONParser parser) {
            while (parser.nextToken() != JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != JSONToken.VALUE_NULL) {
                        if (text == 'kind') {
                            kind = parser.getText();
                        } else if (text == 'title') {
                            title = parser.getText();
                        } //else if (text == 'htmlTitle') {
                          //  htmlTitle = parser.getText();
                        //} 
                        else if (text == 'link') {
                            link = parser.getText();
                        } 
                        //else if (text == 'displayLink') {
                        //    displayLink = parser.getText();
                        //} 
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
    
    
     
    
    public static trial parse(String json) {
        return new trial(System.JSON.createParser(json));
    }
}