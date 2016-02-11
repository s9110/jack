public class SearchController {
    
     public String sname{get;set;}
     public list<account> accountlist {get;set;}
     public list<lead> leadlist{get;set;}
     public list<opportunity> opportunitylist{get;set;}
     public list<contact> contactlist{get;set;}
     public integer countlistsize{get; set;}
     public boolean renderacc{get; set;}
     public boolean rendercon{get; set;}
     public boolean renderopp{get; set;}
     public boolean renderlead{get; set;}
     public String searchStr1{get;set;}
     public List<List<SObject>> results{get;set;}
     
     public SearchController() {
}
     //gets the value of the input text from the page  
     public void search(){
          String searchStr1 = '*'+sname+'*';
            system.debug(sname); 
          String DynamicQuery= 'FIND \'' + searchStr1 + '*\' IN ALL FIELDS '
                                        +' RETURNING Account(Id, Name)'
                                        + ', Lead(Id, LastName,FirstName ) '                                   
                                       +', Opportunity(Id, Name) '
                                       +', Contact(Id, FirstName, LastName) ';
               
          system.debug(DynamicQuery);
          results = search.query(DynamicQuery);
          system.debug(results);
          system.debug('value searched is :' +results);
          accountlist=results[0];
          countlistsize=accountlist.size(); 
          leadlist=results[1];
          opportunitylist=results[2];
          contactlist=results[3];
          if(contactList!=null && !contactList.isEmpty()){
            rendercon = true;
            }
        else{
            rendercon=false;
            }
        if(opportunityList!=null && !opportunityList.isEmpty()){
            renderopp = true;
            }
        else{
            renderopp=false;
            }
            if(leadlist!=null && !leadlist.isEmpty()){
             renderlead = true;
            }
        else{
            renderlead =false;
            }
        if(accountlist!=null && !accountlist.isEmpty()){
            renderacc = true;
            }
        else{
            renderacc=false;
            }
     }
     public void searchcontact() {
         string contactopportunity_DynamicQuery = 'FIND \'' +sname+ '*\' IN ALL FIELDS '
                                                            +' RETURNING '
                                                            +',Opportunity(Id, Name)'
                                                            +',Contact(Id, FirstName, LastName)';
                                                            
         List<List<sObject>> resultopportunitycontact = search.query(contactopportunity_DynamicQuery);
         system.debug('value searched is :' +resultopportunitycontact);
         
         opportunitylist = resultopportunitycontact[0];
         contactlist = resultopportunitycontact[1];
     }
     public void ClearValue() {
      
      PageReference pageRef = new PageReference(ApexPages.currentPage().getURL());
      pageRef.setRedirect(true);
      //return 
      }
                                                            
     
     
                
                
                
        }