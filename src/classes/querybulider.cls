public with sharing class querybulider {

    public static Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    list <String> qobject;
    boolean result;
    public string selectedObject {get; set;}
    public list<string> selectedField {get; set;}
    public list<string> toRemoveValue {get; set;}
    public list<SelectOption> finalFields {get; set;}
    public set<string> setForFields {get; set;}
    public string radioAscending {get; set;}
    public set<string> finalFieldAfterRemoving{get; set;}
    public list<SelectOption> display;
    public String numberOfQueries {get; set;}
    public boolean rend;
    public string query {get;set;}
    public list<string> listStringDisplayFields {get;set;}
    public list<sObject> showTable;
    public boolean check{get;set;}

    public querybulider()
    {
        finalFields=new list<SelectOption>(); 
        rend=false;
        setForFields= new set<string>();
        finalFieldAfterRemoving= new set<string>();
        toRemoveValue = new list<string>();
        query ='';
        radioAscending='ASC';
        listStringDisplayFields=new list<string>();
        showTable= new list<sObject>(); 
        check = false;
        selectedField = new list<string>();
    }

    public List<SelectOption> getObjectNames() {
        rend=false;
        qobject = new list <String>();
        List<SelectOption> objNames = new List<SelectOption>();
        system.debug('schemaMap********'+schemaMap.keySet());
        List<String> entities = new List<String>(schemaMap.keySet());
        for (String itterator : entities){
            sObjectType instance = schemaMap.get(itterator);
            Schema.DescribeSobjectResult resultobject1 = instance.getDescribe();
            result = resultobject1.isQueryable();
            if(result == true){
                qobject.add(itterator);
            }
        }
        qobject.sort();
        objNames.add(new SelectOption('Null', '-- NONE --', true));
        for(String name : qobject) {   
            objNames.add(new SelectOption(name,name));
        }
        system.debug(objNames);
        return objNames;
    }

   public void reset() {
        finalFieldAfterRemoving.clear();
        setForFields.clear();
        finalFields.clear();
   } 

     public List<SelectOption> getObjectFields() {
        system.debug('selectedObject'+selectedObject);
        if(selectedObject <> Null) {
            system.debug('fieldName'+rend);
            if(!rend) {
                system.debug('fieldName'+rend);
                // Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
                Schema.SObjectType ObjectSchema = schemaMap.get(selectedObject);
                Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();

                // Map<String, Schema.SObjectType> schemaMap = new Map<String, Schema.SObjectType>();
                // Map<String, Schema.SObjectField> fieldMap = new Map<String, Schema.SObjectField>();
                
                
                system.debug( fieldMap);
                list<SelectOption> fieldNames1 = new list<SelectOption>();
                setForFields.addAll(fieldMap.keySet());
               
                
                for (String fieldName : setForFields) {
                  fieldNames1.add(new SelectOption(fieldName,fieldName));
                  system.debug(fieldNames1);
                  system.debug(setForFields.size());
                }
                return fieldNames1;
            }
            else {
                system.debug(setForFields);
                list<SelectOption> fieldNames = new list<SelectOption>();
                for (String fieldName : setForFields) {
                    fieldNames.add(new SelectOption(fieldName,fieldName));
                    system.debug(fieldNames);
                }
                return fieldNames;
           }
        }
       else {
            list<SelectOption> fieldNames = new list<SelectOption> {new SelectOption('--None--','--None--')};
            system.debug(fieldNames);
            return  fieldNames;
           }
      }

      public void AddFields() {
          for(string options : selectedField) { 
            setForFields.remove(options);
            system.debug(options); 
            finalFieldAfterRemoving.add(options);  
          }
          selectlist();
      }

      public void selectlist() {
          rend=true;
          finalFields = new list<SelectOption>();
          for(string st:finalFieldAfterRemoving)
          finalFields.add(new SelectOption(st,st)); 
      }

      public void RemoveElements() {
         system.debug('right side picklist'+toRemoveValue);
         for(string options : toRemoveValue) {
             system.debug('options to remove'+options);
             setForFields.add(options);
             finalFieldAfterRemoving.remove(options);
         }
          system.debug('fields in right picklist'+finalFieldAfterRemoving);
          selectlist();
      }

      public list<Selectoption> getdisplay()
      {
          list<SelectOption> newdisplay = new list<SelectOption>();
          newdisplay.add(new SelectOption('5','5'));
          newdisplay.add(new SelectOption('10','10'));
          newdisplay.add(new SelectOption('50','50'));
          newdisplay.add(new SelectOption('100','100'));
          return newdisplay;
      }

      public list<Selectoption> getAscenAndDesend() {
          list<selectOption> asndsn = new list<selectOption>();
          asndsn.add(new SelectOption('ASC','AScending'));
          asndsn.add(new SelectOption('DESC','Descending'));
          return asndsn;
      }

      public void executeQuery() {
        check = true;
        //query ='';
        query ='select ';
        rend = true;
        String addQuery;
        String orderbyfield;
        listStringDisplayFields.clear();
        listStringDisplayFields.addAll(finalFieldAfterRemoving);
        if(!finalFields.isEmpty() )
            {
            addQuery=finalFields[0].getValue(); 
            orderbyfield = finalFields[0].getValue();       
            for(integer i=1; i<finalFields.size(); i++){
            addQuery+=', '+finalFields[i].getValue();              
               }             
            query += ' ' + addQuery+'  From  '+selectedObject+' Order By  '+orderbyfield+' '+radioAscending+' limit '+numberOfQueries ;
            }
        else
        if(finalFields.size()<0 || selectedObject=='' || orderbyfield=='' || numberOfQueries=='')
            {
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Invalid Query'));        
              //  query=null;
            }        
            system.debug('query formed'+query);  
         //query=null;
         
      }
        
      //show table
    public list<sObject> getshowTable() {              
         showTable.clear();
         showTable = Database.query(query); 
         system.debug('records'+showTable);
         return showTable;    
    } 
}