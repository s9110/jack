@isTest
private class showSobject1Test {
    
        public static  Map <String, Schema.SObjectType> mapofObjects = Schema.getGlobalDescribe();
        public static querybulider dynamicInstance = new querybulider ();
        static testMethod void myUnitTest() {
        
        
        //system.assertequals(dynamicInstance.schemaMap.size(),mapofObjects.size());
        
        }
        
        //check the number of fields retrived 
        static testMethod void CheckingfieldsOfTheObject(){
        
       // Map<String, Schema.SObjectType> mapofObjects = Schema.getGlobalDescribe();
        Schema.SObjectType objInstance = mapofObjects.get('Account');
        Map<String, Schema.SObjectField> mapOfFields = objInstance.getDescribe().fields.getMap();
        //querybulider dynamicInstance = new querybulider ();
        dynamicInstance.selectedObject = 'Account';
        List<SelectOption> selcetOptionInstance = new  List<SelectOption>();
        selcetOptionInstance = dynamicInstance.getObjectFields();
        system.assertequals(mapOfFields.size(),selcetOptionInstance.size());
        }
    
        
        //To check the list of fileds added
    static testmethod void AddingThefields()
    {
         //querybulider dynamicInstance = new querybulider ();
         dynamicInstance.selectedObject = 'Account';  
         List<SelectOption> selcetOptionInstance = new  List<SelectOption>();
         selcetOptionInstance = dynamicInstance.getObjectFields();
         system.debug('*********** getObjectFields************ '+ selcetOptionInstance);
         dynamicInstance.rightvalues.add('name');
         dynamicInstance.rightvalues.add('type');
         dynamicInstance.rightvalues.add('id');
         dynamicInstance.rightvalues.add('Billing address');
         dynamicInstance.addselected();
        
         System.assertEquals(4,dynamicInstance.rightvalues.size());  
    }
    //To check the list of fields getting removed 
    static testmethod void RemovingTheFields()
    {
         //querybulider dynamicInstance = new querybulider ();
         dynamicInstance.selectedObject = 'Account';  
         List<SelectOption> selcetOptionInstance = new  List<SelectOption>();
         selcetOptionInstance = dynamicInstance.getObjectFields();
         system.debug('-------getObjectFields------->'+ selcetOptionInstance);
         dynamicInstance.selectedField.add('name');
         dynamicInstance.selectedField.add('type');
         dynamicInstance.addselected();
         dynamicInstance.newselectedField.add('type');
         dynamicInstance.removeselected();
         selcetOptionInstance=dynamicInstance.getObjectFields();
         System.assertEquals(1,dynamicInstance.rightvalues.size());  
    }
    
  
    
    static testmethod void RecordsRetrived(){
        //querybulider dynamicInstance = new querybulider ();
        dynamicInstance.selectedObject = 'Account';  
        dynamicInstance.selectedField.add('name');
        dynamicInstance.selectedField.add('type');
        dynamicInstance.addselected();
        dynamicInstance.selectedsort= 'ASC';
        dynamicInstance.selectedrecords= 5;
        dynamicInstance.execute();
        Account accountInstance = new Account(name='deepa',type='prospect');
        insert accountInstance;
        
    }
    
}