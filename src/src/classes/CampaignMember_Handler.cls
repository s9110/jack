public class CampaignMember_Handler {

    public Set<Id> leadIdSet = new Set<Id>(); 
    //itterate the campaignmemberlist for the lead record

    public void campaignMember(list<CampaignMember> campaignMemberList) {
        //itterate the campaignmemberlist for the lead record and add it to lead list
        for(CampaignMember campaignMemberItterator : campaignMemberList) {
            if(String.isBlank(campaignMemberItterator.leadId)) {
                continue;

            } else {
                leadIdSet.add(campaignMemberItterator.LeadId);
            }
        }

        map<id,Lead> leadMap = new map<id,Lead>([
            SELECT id, RSVP__c 
              FROM Lead 
             WHERE id IN :leadIdSet
        ]);

        //check rsvp on campaign member
        for (CampaignMember campaignMemberItterator : campaignMemberList) {
            if(String.isBlank(campaignMemberItterator.RSVP__c)) {
                if(leadMap.containsKey(campaignMemberItterator.LeadId)) {
                    campaignMemberItterator.RSVP__c = leadMap.get(campaignMemberItterator.LeadId).RSVP__c;
                    continue;
                }

            } else {
                continue;
            }
        }

        //set<id> leadid=new set<id>(leadlist.keyset());
        //map<id,CampaignMember> Campaignmembermap=new map<id,CampaignMember>([select id, Leadid, RSVP__c from CampaignMember where  id IN :leadid]);
    }

}