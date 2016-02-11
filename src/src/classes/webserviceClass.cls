global  class webserviceClassexample {
    global class wrapper {
     Boolean isSuccess;
     Id id;
     string status;
    }
    webService static wrapper create_Lead(string FirstName, string LastName, string Email ,string Phone, String Company) {
     Lead leadinstance = new lead();
     leadinstance.FirstName =  FirstName;
     leadinstance.Company= Company;
     leadinstance.LastName = LastName;
     leadinstance.Email = Email;
     leadinstance.Phone = Phone;
     leadinstance.status='New';
     insert leadinstance;
     wrapper instance=new wrapper();
     instance.id=leadinstance.id;
     return instance;
    }
    
    webService static wrapper delete_Lead(string FName, string LName, string Elemail ,string Phonenum, String Companyname) {
     list <Lead> leadList=new list <Lead>();
     leadList = [ SELECT LastName 
                        , FirstName
                        , Email
                        , Phone
                        , Company
                       FROM lead
                  WHERE LastName = :LName AND 
                 FirstName = :FName AND 
                 Email = :Elemail AND
                 Phone=:Phonenum AND
                 Company = :Companyname];
     wrapper instance=new wrapper();
     
     if(leadList.size() ==0) {
         instance.isSuccess=false;
     }else{
     instance.isSuccess=true; 
     }
     delete leadlist;
     return instance;
    } 
   
     webService static wrapper Update_Lead(string FirstName, string LastName, string Email ,string Phone, String Company) {
     list <Lead> leadList=new list <Lead>();
     leadList= [ SELECT Lastname
                      , FirstName
                      , Email
                      , Phone
                      , Company
               FROM lead
               WHERE lastname=:LastName AND FirstName=:FirstName AND Email=:Email AND Company=:Company];
     wrapper instance=new wrapper();
     if(leadList.size()==0||leadList==null) {
     instance.isSuccess=false;
     }
     else {
         instance.isSuccess=true;
     }
     leadlist[0].Company ='todayis';
     instance.id=leadlist[0].id;                              
     update leadlist;
     return instance;
    }
}