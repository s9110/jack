@RestResource(urlMapping='/Lead Manipulate/*')
global with sharing class RESTLead{
global class wrapper {
     Boolean isSuccess;
     Id id;
     string status;
    }
@HttpPost
global static wrapper createLead(string FirstName, string LastName, string Email ,string Phone,string Company,String status) {
    lead leadinstance=new lead ();
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
@httpPatch
 global static wrapper Update_Lead(string FirstName, string LastName, string Email ,string Phone, String Company){
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
 }        
  return instance;  
}
/*@HttpGet 
 global static wrapper doGet(string FName, string LName, string Elemail ,string Phonenum,string Companyname){
list <Lead> leadList=new list <Lead>();
 string Comapnyname=RestContext.request.params.get(Companyname);
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
                 Company = :Comapnyname];
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
       }*/   
}