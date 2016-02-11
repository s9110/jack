public class goobleForce_Extension {
    public string searchstring {get; set;}
    public string encodeSearch {get; set;}
    public List < Detail__c > detailList {get; set;}
    public List < SearchResult__c > resultList {get; set;}
    public String details {get; set;}
    public List < String > newList {get; set;}
    public List < SearchResult__c > customSearch {get; set;}
    public List < SearchResult__c > searchedList {get; set;}
    public Integer flag {get; set; }
   
    public goobleForce_Extension() {
        flag = 0;
        newList = new List < String > ();
    }

    public void searchbtn() {
        resultList = new List < SearchResult__c > ();
        flag = 1;
        if (!String.isBlank(searchstring)) {
            encodeSearch = EncodingUtil.urlEncode(searchstring, 'UTF-8');
            system.debug('***********SUBJECT***********' + encodeSearch);
            resultList = [Select Body__c
                                  ,Title__c
                                  , Kind__c
                                  , Link__c
                                  , Description__c
                          FROM SearchResult__c
                          WHERE Body__r.Body__c = : encodeSearch ];
            system.debug('******* RESPONSE LIST **********' + resultList);
            if (!resultList.isEmpty()) {
                flag = 1;
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO, 'The keyword is already searched.');
                ApexPages.addMessage(myMsg);
            } else {
              system.debug('**********'+encodeSearch);
              Detail__c detailintance = new Detail__c();
              detailintance.Body__c = encodeSearch;
              detailintance.Subject__c = 'search string';
              insert detailintance; 
              
              //goobleResponse.doGet(searchstring1);
              customSearch = [SELECT  Body__c
                                     ,Title__c
                                     ,Kind__c
                                     ,Link__c 
                                     ,Body__r.Body__c
                             FROM SearchResult__c
                             WHERE Body__r.Body__c = :encodeSearch ];
              // system.debug('*****FROM PAGE SEARCH *********' + customSearch);
            }
        } else if (searchstring.length() <= 3)
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL, 'Input string than three'));
    }

    public ApexPages.StandardSetController con {
        get {
            if (con == null) {
                con = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id
                                                                                           , Body__c
                                                                                           , Subject__c
                                                                                    FROM Detail__c
                                                                                    WHERE Subject__c != ''
                                                                                  ]));
                // sets the number of records in each page set
                con.setPageSize(3);
            }
            return con;
        }
        set;
    }
    public Boolean hasNext {
        get {
            return con.getHasNext();
        }
        set;
    }
    
    // indicates whether there are more records before the current page set.
    public Boolean hasPrevious {
        get {
            return con.getHasPrevious();
        }
        set;
    }

    // returns the previous page of records
    public void Previous() {
        con.previous();
        historybtn();
    }

    // returns the next page of records
    public void Next() {
        con.next();
        historybtn();
    }

    public void historybtn() {
       detailList = con.getRecords();
        system.debug('******** RESPONSE LIST **************' + detailList);
    }

    public void getDetails() {
       system.debug('*********record to find is'+details);
       resultList = [SELECT Body__c
                              ,Title__c 
                              , Kind__c
                              , Link__c
                              , Body__r.Body__c 
                              , Description__c
                      FROM SearchResult__c 
                      WHERE Body__c = : details
                        ];
        system.debug('the list is '+resultList);
    }

    
}