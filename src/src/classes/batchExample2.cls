global  class batchExample2 implements database.batchable <sobject>{

    //global string query='[SELECT id, JSONstring__c, Object__c FROM Event__c;]';
    global Database.QueryLocator start( Database.BatchableContext batchableContext) {
        return database.getQueryLocator('SELECT id, JSONstring__c, Object__c FROM Event__c');
    }

    global void execute (Database.BatchableContext batchableContext
                         ,list<Sobject> scope) {
        system.debug(scope);
        list<Event__c> eventlist=new list<Event__c>();
        //eventlist.addall(scope);
        system.debug(eventlist);
        for(Sobject sc : scope) {
            Event__c event=new Event__c();
            event = (Event__c)sc;
             system.debug(eventlist);
           eventlist.add(event);
        }
        system.debug(eventlist);
        for(Event__c itterator : eventlist) {
            system.debug(itterator.JSONstring__c);
            
             Map<String,Object> JSONstring = (Map<String,Object>)JSON.deserializeUntyped(itterator.JSONstring__c);
              //string JSONstrin=JSON.deserilisze(JSONstring,string.class);
            
            //system.debug(JSONstrin);
            Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
            //cretae an instance of a token i.e an object  
            Schema.SObjectType token1 = gd.get(itterator.Object__c);
            Sobject newobject =  token1.newSobject();
            for( string str : JSONstring.keySet() ){
                newobject.put(str,JSONstring.get(str));
            }
            insert newobject;
        }
                         }

    global void finish(Database.BatchableContext batchableContext) {
        system.debug('in finish');
    }
}