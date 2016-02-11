public class RSVP {
	public  Set<Id> leadIdSet = new Set<Id>(); 
	
	//itterate the campaignmemberlist for the lead record
	public  void campaign_Member(list<CampaignMember> campaignMemberList)
	{
        //itterate the campaignmemberlist for the lead record and add it to lead list
		for(CampaignMember campaignMemberItterator : campaignMemberList)
		{ 
			if(String.isBlank(campaignMemberItterator.LeadId))
			{
				return;
			}
			else 
			{
				leadIdSet.add(campaignMemberItterator.LeadId);		
			}
								
		}
		
		
		map<id,Lead> leadMap=new map<id,Lead>([select id, RSVP__c from Lead where  id IN :leadIdSet]);	
		set<id> leadidset1=leadmap.keyset();
		
		//check rsvp on campaign member
		for (CampaignMember campaignMemberItterator :campaignMemberList )
		{
			if(String.isBlank(campaignMemberItterator.RSVP__c))
			{
				if(leadMap.containsKey(campaignMemberItterator.LeadId) == true)
				{
					campaignMemberItterator.RSVP__c = leadMap.get(campaignMemberItterator.LeadId).RSVP__c;
					continue;
				}
				
			}
			else
			{
				continue;
			}
		}
		
	}
    
}