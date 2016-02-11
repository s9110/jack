// class contains the method to create only one clone of the opportunity record
public Class Handler_clone {
    public static Boolean run;
    static {
        run = true;
    }
    //list<Opportunity> list_opportunity=new list<Opportunity>(trigger.new);
    public static void clone_opportunity(list < Opportunity > opportunity_list) {
        //list<Opportunity> list_opportunity=new list<Opportunity>();
        if (true == Handler_clone.run) {
            system.debug('clone trigger');
            list < Opportunity > list_opportunity = new list < Opportunity > ();
            for (Opportunity itterator_opportunity: opportunity_list) {
                Opportunity cloneopp = itterator_opportunity.clone(false, true, false, false);
                cloneopp.Parent_Opportunity__c = itterator_opportunity.Id;
                list_opportunity.add(cloneopp);
                system.debug(cloneopp);
            }
            Handler_clone.run = false;
            system.debug('clone trigger');
            insert list_opportunity;
        } else {
            return;
        }
    }
}
//clone(opt_preserve_id,opt_IsDeepClone, opt_preserve_readonly_timestamps,opt_preserve_autonumber);