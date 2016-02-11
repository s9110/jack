global class sample implements Schedulable
{   global void execute(SchedulableContext ctx) 
    {      List<Account> acc = [SELECT id from Account];
               system.debug(acc); 
               }
    }