@isTest
     public with sharing class TestCountryCity {

     public static testMethod void myUnitTest() {
        List<Country__c> countryList = new List<Country__c>();
        List<City__c> cityList = new List<City__c>();
        Country__c country = new Country__c();
        country.Name='India';
        countryList.add(country);

        City__c city = new City__c();
        city.Name='pune';
        city.Country__c='India';
        cityList.add(city);
        
        Test.startTest();
        insert country;
        insert city;
         customtrial conCityInstance = new  customtrial();
         
         conCityInstance.getcities();
       Test.stopTest();

        //System.assertEquals(conCityInstance.city[1].getLabel(),'pune');
    }
}