public class Bestpractise {
    public void contactTriggerMethod(List < Contact > contactList) {
        //Getting the domain of email field of contact
        Set<String> DomainSet=new Set<String>();
        String domain;
        String emailVaraible;
        String emailAfterSplit;
        for(Contact contactObject : contactList)
        {
            if(contactObject.Email!=NULL)
            {
            emailVaraible=contactObject.Email;
            emailAfterSplit=emailVaraible.substringAfter('@');
            domain=emailAfterSplit.substringBefore('.');
            DomainSet.add(domain);
            }
        }
        List<Account> accountList = [Select Name
                                 FROM Account
                                 WHERE Name IN:DomainSet];
        System.debug('Account List'+accountList);
        Map<String,Id> accountMap=new Map<String,id>();
         for(Account accountIterator:accountList)
         {
             if(accountIterator!=NULL)
            {
                accountMap.put(accountIterator.Name,accountIterator.id);
            }
         }
         for(Contact contactIterator : contactList)
         {
            String domainName;
            emailVaraible=contactIterator.Email;
            emailAfterSplit=emailVaraible.substringAfter('@');
            domainName=emailAfterSplit.substringBefore('.');
            contactIterator.AccountId = accountMap.get(domainName);
         }
    }
} 