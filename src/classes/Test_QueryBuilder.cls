/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class Test_QueryBuilder {


        static testMethod void myUnitTest() {
        
        Map <String, Schema.SObjectType> mapofObjects = Schema.getGlobalDescribe();
        querybulider dynamicInstance = new querybulider ();
        // system.debug('*************'+dynamicInstance.getObjectNames().size());
        //system.assertEquals(FALSE,dynamicInstance.schemaMap.size(),mapofObjects.size());
        system.assertEquals(FALSE,dynamicInstance.getObjectNames().size()==mapofObjects.size(),'the list in not equal');
        }
        
        //check the number of fields retrived 
        static testMethod void CheckingfieldsOfTheObject(){
        
        Map<String, Schema.SObjectType> mapofObjects = Schema.getGlobalDescribe();
        Schema.SObjectType objInstance = mapofObjects.get('Account');
        Map<String, Schema.SObjectField> mapOfFields = objInstance.getDescribe().fields.getMap();
        querybulider dynamicInstance = new querybulider ();
        dynamicInstance.selectedObject = 'Account';
        dynamicInstance.getObjectFields();
        //system.debug('$$$$$$$$$$$$$$$$$'+dynamicInstance.getObjectFields());
        List<SelectOption> selcetOptionInstance = new  List<SelectOption>();
        selcetOptionInstance = dynamicInstance.getObjectFields();
        system.assertequals(mapOfFields.size(),selcetOptionInstance.size());
        }
        
    static testmethod void AddingThefields()
    {
         querybulider dynamicInstance = new querybulider ();
         dynamicInstance.selectedObject = 'Account';  
         List<SelectOption> selcetOptionInstance = new  List<SelectOption>();
         selcetOptionInstance = dynamicInstance.getObjectFields();
         system.debug('*********** getObjectFields************ '+ selcetOptionInstance);
         dynamicInstance.selectedField.add('name');
         dynamicInstance.selectedField.add('type');
         dynamicInstance.selectedField.add('id');
         dynamicInstance.selectedField.add('Billing address');
         dynamicInstance.AddFields();
        
         System.assertEquals(4,dynamicInstance.selectedField.size());  
    }
    
    //To check the list of fields getting removed 
    static testmethod void RemovingTheFields()
    {
         querybulider  dynamicInstance = new querybulider ();
         dynamicInstance.selectedObject = 'Account';  
         List<SelectOption> selcetOptionInstance = new  List<SelectOption>();
         selcetOptionInstance = dynamicInstance.getObjectFields();
         system.debug('-------getObjectFields------->'+ selcetOptionInstance);
         dynamicInstance.selectedField.add('name');
         dynamicInstance.selectedField.add('type');
         dynamicInstance.AddFields();
         dynamicInstance.toRemoveValue.add('type');
         dynamicInstance.RemoveElements();
         selcetOptionInstance=dynamicInstance.getObjectFields();
         System.assertEquals(1,dynamicInstance.toRemoveValue.size());
         System.assertEquals(2,dynamicInstance.selectedField.size());   
    }
    
  
    
    static testmethod void RecordsRetrived(){
        querybulider dynamicInstance = new querybulider ();
        dynamicInstance.selectedObject = 'Account';  
        dynamicInstance.selectedField.add('name');
        dynamicInstance.selectedField.add('type');
        dynamicInstance.AddFields();
       // dynamicInstance.asndsn= 'ASC';
        //dynamicInstance.selectedrecords= 5;
        dynamicInstance.executeQuery();
        Account accountInstance = new Account(name='sheetal',type='prospect');
        insert accountInstance;
        
    }
    
}