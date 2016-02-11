public class query1 
{
    // create a object map in order to get them later in the query
    public map<string, Schema.SobjectType> objects {set;get;}  
    public list<string> objectlist {get;set;}
    public set<string> objectset{set;get;}
    
    
    public void query1(){
    objects=Schema.getGlobalDescribe();
    objectlist.addAll(objects.keySet());
    objectlist.sort(); 
    system.debug(objectlist);
    }
}