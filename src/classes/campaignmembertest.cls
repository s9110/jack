@isTest (SeeAllData=false)
public class campaignmembertest {
	//create the test data
	public void createcampaignmember()
	{
		Lead leadInstance=new Lead();
		leadInstance.RSVP__c='';
		leadInstance.LastName='gkj';
		leadInstance.Company='sdd';
		CampaignMember campaignmemberInstance=new CampaignMember();
		campaignmemberInstance.Leadid=leadInstance.id;
		
	
		
		 Test.startTest();
		 insert leadInstance;
		 insert campaignmemberInstance;
		 CampaignMember cmlist=[select id, LeadId, RSVP__c from CampaignMember];
		 if(campaignmemberInstance.leadId==cmlist.LeadId)
	    	{
                campaignmemberInstance.RSVP__c=cmlist.RSVP__c;	
		    }
		 
		 
		 Test.stopTest();
		system.assertEquals(campaignmemberInstance.RSVP__c,leadInstance.RSVP__c);
	}
	
}