public class student_saveController {
     public ApexPages.StandardController controller;  
     public String code{get; set;}
     public String select1{get; set;}
     public Student__c student{get; set;}

    public student_saveController(ApexPages.StandardController controller){}

     public void changelanguage()
      {
          system.debug('hello world');
          //system.debug(Language);
          if( select1 == 'English') {
            code = 'en_US';
            system.debug( code);
           }
        else if( select1 == 'French') {
            code = 'fr_FR';
            system.debug( code);
          }else  if( select1 == 'German'){
            code = 'de_DE ';
            system.debug( code);
           }
          //return null; 
        }//if(selectedpagelanguage)
        public void save(){
            // override the standard save functionality
            controller.save();
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Form Successfully submitted'));
            }
     }