public  class testfactory {
	//method to create t6he account data
	public list<Account> methodaccount()
	{ 
		list<account> accountList= new list<account>();
		for(integer iTemp=0; iTemp<=6; iTemp++)
		{
		Account accountObj= new Account();
		accountObj.name='sheetal'+itemp;
		accountObj.AccountNumber='52137';
		accountObj.AccountSource='humtydumpty';
		accountObj.CleanStatus='2015';
		
		//accountObj.Owner='ntuser';
		accountList.add(accountObj);
		}
		return accountList;
	}
	
	//method to create Campaign
	public  list<Campaign> methodCampaign()
	{
		list<Campaign> campaignList= new list<Campaign>();
		for(integer iTemp=0; iTemp<=6; iTemp++)
		{
		Campaign campaignObj= new Campaign();
		 campaignObj.IsActive='true';
		 campaignObj.ActualCost='52137';
		 campaignObj.Name='promotion';
		 campaignObj.Type='2015';
		 campaignObj. Description='block no 90'+itemp;
		 campaignObj.BudgetedCost='4542132';
		 campaignList.add(campaignObj);
		}
	return campaignList;
	}
	
	
	//method to create lead
	public  list<Lead> methodLead()
	{
		list<Lead> leadlist=new list<Lead>();
		for(integer iTemp=0; iTemp < 10; iTemp++)
		{
			Lead leadInstance=new Lead();
			if(String.isEmpty(leadInstance.RSVP__c))
			{
				
				leadInstance.name='sheetal';
				leadInstance.RSVP__c='';
				leadlist.add(leadInstance); 
	        }
	        else
			{
				leadInstance.name='samba';
				leadInstance.RSVP__c='status';
				leadlist.add(leadInstance);
			}
		
			return leadList;
	     }
	}
	// method to create campaign member
	public list<CampaignMember> methodcampaignmember()
	{
		list<CampaignMember> campaignmemberList= new list<CampaignMember>();
		for(integer iTemp=0; iTemp<=6; iTemp++)
		{
		CampaignMember campaignmemberObj= new CampaignMember();
		 campaignmemberObj.IsActive='true';
		 campaignmemberObj.ActualCost='52137';
		 campaignmemberObj.Name='promotion';
		 campaignmemberObj.Type='2015';
		// campaignmemberObj. Description='block no 90'+itemp;
		 campaignmemberObj.BudgetedCost='4542132';
		 campaignmemberList.add(campaignmemberObj);
		 
		}
	return campaignmemberList;
			
	}
	
	
    
}