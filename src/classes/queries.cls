public class queries {
//Query on all Contact records and add them to the List. Print that contents of this list.
 public void mapAccount1() {
    list<Account> acc_list=[SELECT Name
                                   ,id 
                            FROM Account];
    map<String,Id> acc_map=new map<String,Id>();
    for (Account a : acc_list) {
         if(acc_map.containsKey(a.name)) {
            continue;
        }
         else {
            acc_map.put(a.name,a.id);
         }
    }
    system.debug('the map of accounts is '+acc_map);
 }
 
 public void activeUer() {  
    list<User> user_list=[SELECT FirstName
                          FROM User 
                          WHERE ISActive=true];
    //system.debug('active user are' +user_list);
    map<Id,User> usersmap=new map<Id,User>(); 
    usersmap.putAll( user_list);
    system.debug('active user are' +usersmap);
 }

 public void mapAccount2() {
     list<Account> acc_list=[SELECT id FROM Account];
     map<Id,Account> acc_map=new map<Id,Account>();
     acc_map.putAll(acc_list);
     system.debug('the map of accounts is '+acc_map);
    }

 public void multiselect() {
     list<Account> acc_list=[SELECT Name
                                   , Id
                             FROM Account
                             WHERE Enrollment__c includes('2013','2014') ];
     system.debug('lsit of 2013 or 2014 is:'+acc_list);
 }

 public void singleSelect() {
     list<Account> acc_list=[SELECT Name
                                   , Id 
                             FROM Account
                             WHERE Enrollment__c ='2010' ];
     system.debug('lsit of 2010 is:'+acc_list);
 }

 public void billingAccount() {
     list<account> acc_lsit=[SELECT a.Name
                                    , a.Id
                                    , a.BillingState
                             FROM Account a 
                             WHERE a.BillingState 
                             NOT IN('Singapore','Paris') Order BY a.BillingState desc];
     system.debug('list of the accounts enrolled in 2010 are'+acc_lsit);
 }
 
 public void opportunityMethod4() {
     list<Opportunity> opportunity_list=[SELECT id
                                               , Name 
                                         FROM opportunity 
                                         WHERE Amount > 10000 order BY CreatedDate  ALL ROWS  ];
     system.debug('lsit of opportunity is'+opportunity_list);
     //offset50
 }
 
 public void opportunityMethod3() {
    AggregateResult[] opportunityList=[SELECT FISCAL_YEAR(CloseDate)
                                              , SUM(Amount) 
                                         FROM Opportunity 
                                         GROUP BY FISCAL_YEAR(CloseDate)];
    map<integer,decimal> opportunity_map= new map<integer,decimal>();
    for(AggregateResult iterator : opportunityList) {
        integer year=(integer)iterator.get('expr0');
        decimal amount=(decimal)iterator.get('expr1');
        if(opportunity_map.containsKey(year)) {
            continue; 
            }
        else {
            opportunity_map.put(year,amount);    
        }
    }
     system.debug('the map of opportunity is '+opportunity_map);
 }


 public void  leadSource() {
     AggregateResult[] lead_list =[SELECT  Status 
                                          , LeadSource 
                                          ,count(name)
                                   FROM Lead 
                                   group by Status, Leadsource];
     map<string, map<string, integer>> lead_map= new map<string, map<string,integer>>();
     system.debug(''+lead_list);
     for(AggregateResult ll : lead_list) {
        string status = (string) ll.get('Status');
        string leadsource = (string) ll.get('LeadSource');
        Integer count = (integer) ll.get('expr0');
        if(!lead_map.containsKey(status)) {
            lead_map.put(status, new Map<string, integer> { leadsource => count } );
            } 
         else {
            if(!lead_map.get(status).containsKey(leadsource)) {
                lead_map.get(status).put(leadsource, count);
             }
        else
        {
            continue;
        }
     }
 }
    system.debug('the map is'+lead_map);
    }

 public void  leadAggregate() {
    AggregateResult[] lead_list =[SELECT LeadSource
                                        ,count(name)
                                 FROM Lead group by Leadsource having count(name)>10];
    system.debug(''+lead_list);
}

 public void  leadLog() {
    list<Log__c> log_list= new list<Log__c>();
    list<Lead> lead_list= new list<lead>();
    for(integer i=1;i<=100;i++)
     {
        if(i==1||i==10||i==6) {
         Lead demo=new  Lead();         
         lead_list.add(demo);
         }
         else { 
         Lead demo=new  Lead();
         demo.Firstname ='abc'+i;
         demo.Lastname ='ss'+i;
         demo.Company='abd';
         demo.Status='Open';
         lead_list.add(demo);
         } 
     }
    system.debug(lead_list);
    Database.SaveResult[] srList = Database.insert(lead_list, false);
    for(Database.SaveResult sr : srList)
    {
         if(sr.isSuccess()) {
           System.debug('THE SUCCESS ID ARE:'+sr.getId());
         } else {
           for(Database.Error err : sr.getErrors()) {
                Log__c log_demo=new Log__c(error__c='The Insertion has failed .');
                log_list.add(log_demo);
           }   
         }
    } 
    Database.insert(log_list,true);
    system.debug('the list of log is '+log_list);
 }

   public void accountMethod(){
     list<Account> accountlist=[SELECT id
                               , name 
                         FROM account 
                         WHERE CreatedDate=LAST_90_DAYS AND Active__c='No' ];
     system.debug('the record sare has occured'+accountlist);
     delete accountlist;
     
   }

 public void assetMethod() {
    Asset assetInstance = new Asset();
    assetInstance.AccountId ='bnd';
    assetInstance.ContactId='gonzales';
    assetInstance.Name='koala';
    assetInstance.Line_Item_Id__c='908';
    try
        {
        upsert assetInstance Line_Item_Id__c;
        }
     catch(DMLException e){
    system.debug('an exception has occured');
     }
}


 public void opportunityMethod() {
    list<Opportunity> opportunity_list=[SELECT id
                                              , Name
                                        FROM opportunity 
                                        WHERE Amount > 10000 order by CreatedDate ALL ROWS];
    system.debug('lsit of opportunity is'+opportunity_list);
 }
 
 public void soslMethod() {
     list<list<Sobject>> soslList = [FIND 'test' IN ALL FIELDS RETURNING 
                                                  contact(ID, name)
                                                , Lead(id, name)
                                                , Account(Id, Name)
                                                , User(Id,Name)];
     system.debug(soslList);
 
 }
}