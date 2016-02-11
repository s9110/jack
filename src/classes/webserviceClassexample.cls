global  class webserviceClassexample {
    global class wrapper {
     Boolean isSuccess;
     Id id;
     string status;
    }
    webService  Static wrapper create_Lead(string FirstName, string LastName, string Email ,string Phone,string Company,String status) {
     Lead leadinstance = new lead();
     leadinstance.FirstName =  FirstName;
     leadinstance.LastName = LastName;
     leadinstance.Email = Email;
     leadinstance.Phone = Phone;
     leadinstance.status='New';
     leadinstance.Company=Company;
     wrapper instance=new wrapper();
     try {     
         insert leadinstance; 
         }
     catch (Exception e) {   
         
         instance.status='error';
         }
     
         return instance;
              
        }

    webService Static wrapper delete_Lead(string FName, string LName, string Elemail ,string Phonenum, String Companyname) {
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
                 for(lead leaditterator: leadList){
       try{
       delete leaditterator;
       instance.isSuccess=true; 
       } 
       catch (Exception e) {
        
        instance.isSuccess=false;
        instance.status=(''+e);
       }
      
      
       } return instance;    
       }   
     
     webService  static wrapper Update_Lead(string FirstName, string LastName, string Email ,string Phone, String Company) {
     list <Lead> leadList=new list <Lead>();
     leadList= [ SELECT Lastname
                      , FirstName
                      , Email
                      , Phone
                      , Company
               FROM lead
               WHERE lastname=:LastName AND FirstName=:FirstName AND Email=:Email AND Company=:Company];
     wrapper instance=new wrapper();
     for(lead leaditterator: leadList)
     {
     try{
       update leaditterator;
       instance.isSuccess=true; 
       } 
       catch (Exception e) {
        
        instance.isSuccess=false;
        instance.status=(''+e);
       }
       
      
        }  return instance;  
  } 
}