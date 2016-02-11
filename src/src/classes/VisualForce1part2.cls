global with sharing class VisualForce1part2 {
    public List<account> accountList{get;set;}
    public List<contact> contactList{get;set;}
    public List<opportunity> opportunityList{get;set;}
    public boolean renderopp{get; set;}
    public boolean rendercon{get; set;}
    public String accountId{get;set;}
    public String contactId{get; set;}
    
    public VisualForce1part2(ApexPages.StandardController controller) {
        accountList = [SELECT Id
                            ,Name
                            ,AccountNumber
                            ,Phone
                            ,BillingCity
                            ,BillingState
                            ,BillingCountry 
                       FROM account LIMIT 5];   
        renderopp = false;
        rendercon = false;    
        system.debug('----Constructor Account ID----------'+accountId);
    }

    public void getDetails() {
        contactList=[SELECT Name,Contact.Account.Name FROM Contact WHERE AccountId=:accountId];
        opportunityList=[SELECT Name,Opportunity.Account.Name FROM Opportunity WHERE AccountId=:accountId];  
    
        system.debug('**************'+accountList);
        system.debug('-------------'+contactList);
        system.debug('**************'+opportunityList);
        system.debug('--------------'+accountId);

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

        system.debug('******************'+rendercon);
        system.debug('******************'+renderopp);
    }

    
/*@RemoteAction
    global static Contact getdelete(String contactId) {
        List<Contact> condel;
        system.debug('contactId==='+contactId);
        condel=[Select Id,Name From Contact Where Id = :contactId];
        Delete condel[0];
        return condel[0];
    }*/
}