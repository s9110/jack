public with sharing class method {
	public  void display()
	{
	List<Contact> ListAccounts=[Select c.AccountId, Name From Contact c] ;
    System.debug('the list of accounts is:'+ListAccounts);
	}
    public void add_account()
    {
    	Account accn=new Account(Name='dev sharma');
        insert(accn);
    }
    public void add_contact()
    {
    	Contact con=new Contact(LastName='sharma',Highest_Qualification__c='mba',Expecienced__c='yes');
        insert(con);
    }
    public void add_lead()
    {
    	Lead lead_new= new Lead(FirstName='dev', LastName='sharma' ,Company='Dnb', follow_up__c=date.today());
		insert (lead_new);
    }
    public void add_opportunity()
    {
    	Opportunity opp_new= new Opportunity(StageName='Prospecting',CloseDate=date.today(),Name='dev');
		insert (opp_new);
    }
}