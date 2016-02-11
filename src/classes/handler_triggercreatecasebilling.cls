public class handler_triggercreatecasebilling {
    //before insert after update
    public static final string Type ='Unable to cross ship';
    public static final string status = 'newly created';
    public static final string priority = 'Medium';
    public static final string reason = 'Unable to Ship';
    public static final string origin = 'Internal';
    public static final string owner = '00G28000000mTZ5';


    public void salescheck(list<Sales_header__c> saleslist)
    {
        list<Case> caselist = new list<Case>();
        set<id> salesIdset = new set<id>();
        Case caseobj=new Case();
        for(Sales_header__c salesobj : saleslist) {
            salesIdset.add(salesobj.EFT_lookup__c);
        }
        map<id, EFT_Transaction_Status__c> transactionstatusmap = new map<id,EFT_Transaction_Status__c> ([
            SELECT Id, Transaction_date__c, Transaction_Status__c
              FROM EFT_Transaction_Status__c
             WHERE id IN :salesIdset 
        ]);
        for(Sales_header__c salesobj : saleslist){
            if(salesobj.Status__c == 'Open'
               && salesobj.Total_Amount__c > 300) {
                system.debug('open and amount greater than 300');
                if(!(( (salesobj.Bill_to_Street__c.equals(salesobj.Ship_to_Street__c)) &&
                        (salesobj.Bill_to_state__c.equals(salesobj.Ship_to_state__c))) ) 
                                                         &&
                        ((salesobj.Bill_to_Postal_Code__c.equals(salesobj.Ship_to_Postal_code__c))&&
                            (salesobj.Bill_to_city__c.equals(salesobj.Ship_to_city__c))
                        )
                      )
                  {
                        caseobj.Status = status;
                        caseobj.Type = Type;
                        caseobj.OwnerId = owner;
                        caseobj.Open_Sales_Order__c= salesobj.Id;
                        caseobj.Priority = priority;
                        caseobj.Reason = reason;

                        system.debug('case created');

                        caseobj.AccountId=salesobj.Account__c;
                        caseobj.Origin = origin;

                        system.debug(salesIdset);
                        system.debug(salesobj.id);

                        system.debug(transactionstatusmap);
                        caseobj.Transaction_Status__c = transactionstatusmap.get(salesobj.EFT_lookup__c).Transaction_Status__c;
                        caseobj.Sales_Order_number__c=salesobj.name;
                        caseobj.Order_date__c = transactionstatusmap.get(salesobj.EFT_lookup__c).Transaction_date__c;
                        caselist.add(caseobj);

                        system.debug(caseobj);
                }
            system.debug(caselist);
               }
        }
        insert caselist;
    }
}