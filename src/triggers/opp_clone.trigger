trigger opp_clone on Opportunity (after insert) {
    //list<Opportunity> opportunity_list= new list<Opportunity>(trigger.new);
    Handler_clone.clone_opportunity(trigger.new);
}