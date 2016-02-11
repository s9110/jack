Public with sharing class newClass {

    public Static soapSforceComSchemasClassLeadwebser.SessionHeader_element trialmethod(){
     public partnerSoapSforceCom.LoginResult loginstance = new partnerSoapSforceCom.LoginResult();
     public partnerSoapSforceCom.Soap soapinstance = new partnerSoapSforceCom.Soap();
     loginstance = soapinstance.login('sheetal@abmeribari.com','sangtani10bQDdhJc73vydUMAYig11H3iH'); 
     soapSforceComSchemasClassWebservice.SessionHeader_element sessionidinstance = new soapSforceComSchemasClassWebservice.SessionHeader_element();
     sessionidinstance.sessionId = loginstance.sessionId();
     return sessionidinstance;
    }
}