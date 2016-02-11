trigger createCampaignmembertrigger on CampaignMember (before insert,before update) {
    integer triggernewsize= trigger.new.size();
    system.debug('size of trigger is '+triggernewsize);

    CampaignMember_Handler campaignMemberHandler = new CampaignMember_Handler();
    campaignMemberHandler.campaignMember(trigger.new);

}