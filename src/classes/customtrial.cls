public with sharing class customtrial {
    public String selectedCountry{get;set;}
    public String selectedCity{get;set;}
    public List<SelectOption> countryList {get; set;}
    public List<SelectOption> cities {get;set;}
 
    public customtrial() {
         system.debug('hello there');
        countryList = new List<SelectOption>();
        countryList.add(new SelectOption('None','--- None ---'));
        List<Country__c> countryLst = [Select Name from Country__c];
        if(!countryLst.isEmpty()) {
            for(Country__c countryIterator : countryLst)
                countryList.add(new SelectOption(countryIterator.Name,countryIterator.Name));
        }
    }
    public List<SelectOption> getcities() {
        system.debug('hello there');
        cities = new List<SelectOption>();
        list<City__c> citylist = new list<City__c>([Select Name from City__c where Country__c = :selectedCountry ]);
        system.debug('**********'+citylist);
        cities.add(new SelectOption('None','--- None ---'));
        system.debug('**********'+citylist);
        if(!citylist.isEmpty()) {
            for(City__c c : citylist)
                cities.add(new SelectOption(c.Name,c.Name));
                system.debug('**********'+cities);
        }
        return null;
    }
}