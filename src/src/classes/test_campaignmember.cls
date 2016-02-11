@isTest
private class test_campaignmember {
    static testMethod void createCampaignMember(){
        Lead leadInstance = new Lead();
         leadInstance.RSVP__c='hedfgby';
         leadInstance.LastName='gkj';
         leadInstance.Company='sdd';
         insert leadInstance;

         Campaign campaign = new Campaign();
         campaign.Name = 'test Campaign';
         insert campaign;

         CampaignMember campaignmemberInstance=new CampaignMember();
         campaignmemberInstance.Leadid=leadInstance.id;
         campaignmemberInstance.CampaignId = campaign.id;

         Test.startTest();
         insert campaignmemberInstance;
         Test.stopTest();

        CampaignMember campaignMemberList = [
            SELECT Id
                 , LeadId
                 , RSVP__c
              FROM CampaignMember
             WHERE Id = :campaignmemberInstance.Id
        ];
        System.assertEquals(true,campaignMemberList.RSVP__c == leadInstance.RSVP__c
                           ,'createCampaignMember method failed : RSVP does not match');

    }
}