global class controller_accountContact {
   
    public string searchString { set;get; }
   
    public list<account> accountlist {get;set;}
    public integer accountlistsize {get; set;}
    public list<contact> contactlist {get;set;} 
    public Set<id> accountIdset {get;set;}
    public string contactId {get; set; } 
    public string linkValue {get; set; } 

     public void searchAccount() {
        system.debug(''+searchString);
        system.debug('hello');
        accountlist = Database.query('SELECT Id, Name FROM Account WHERE Name=:searchString');
        system.debug(accountlist);
        accountlistsize = accountlist.size();
        system.debug(accountlistsize);
        contactlist=[SELECT Id, name from Contact WHERE AccountId IN :accountlist];
     }
     @RemoteAction
   global static Contact removecontact(string linkValue) {
        system.debug('conID==='+linkValue);
       list<Contact> contactDelete=[Select Id,Name From Contact Where Id = :linkValue];
        Delete contactDelete[0];
        return contactDelete[0];
       }

   
 
    global void ClearValue() {
      PageReference pageRef = new PageReference(ApexPages.currentPage().getURL());
      pageRef.setRedirect(true);
      //return 
      }
}