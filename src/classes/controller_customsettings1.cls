public class controller_customsettings1 {
    public String country { get; set;}
    public String city { get; set; }
    
    Map<String,City__c> c = City__c.getall();
    public list<selectoption> getCityList() {
        list<selectoption> s = new list<selectoption> ();
        s.add(new selectoption('','Select one'));
        if(country == null){
            country='';
            }
        else if(c.containskey(country)) {
            s.clear();
            string sm = c.get(country).name;
            for(string st: sm.split(';'))
                s.add(new selectoption(st,st));
            }
        return s;
    }

    public List<SelectOption> getCountrylist() {
        List<SelectOption> country = new List<SelectOption>();
        country.add(new selectoption('India','---SELECT ONE---'));
        list<string> countryname= new list<string>();
        countryname.addall(c.keyset());
        for(string s : countryname){
            country.add(new selectoption(s,s));
            }
        return country;
    }
} 

/*{
        // Variables to store country and city selected by user
   
    public String city { get; set; }

    public String country {get; set;} 
     
    public Custom_Set_Controller(){ }
        // Generates country dropdown from country settings

    public List<SelectOption> getCountriesSelectList() {

        List<SelectOption> options = new List<SelectOption>();

        options.add(new SelectOption('', '-- Select One --'));       

        
        // Find all the countries in the custom setting

        Map<String, Country__c> countries = Country__c.getAll();


        // Sort them by name

        List<String> countryNames = new List<String>();

        countryNames.addAll(countries.keySet());

        countryNames.sort();

         
        // Create the Select Options.

        for (String countryName : countryNames) 
        {

            Country__c country = countries.get(countryName);

            /*The constructor for the select option expects 2 arguments (value and label).   
            Since the constructor isn't overloaded, the system can't find the constructor 
            that accepts only one argument and that is why you are getting the error.
            
            options.add(new SelectOption(country.Name,country.Name));

        }

        return options;

    }

        // To generate the cities picklist based on the country selected by user.

    public List<SelectOption> getCitiesSelectList() {

        List<SelectOption> options = new List<SelectOption>();

        // Find all the cities we have in custom settings.

        Map<String,City__c> allcities = City__c.getAll();
        

        // Filter cities that belong to the selected country

        Map<String, City__c> cities = new Map<String, City__c>();

        for(City__c city : allcities.values()) {

            if (city.Country__c == this.country) {

                cities.put(city.name, city);

            }

        }


      // Sort the cities based on their names

        List<String> cityNames = new List<String>();

        cityNames.addAll(cities.keySet());

        cityNames.sort(); 

         
*/