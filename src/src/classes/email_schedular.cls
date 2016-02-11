global  class email_schedular implements Schedulable{
    //this schedular runs every day after half hour
    public static string cron= '*/30 * * * * ';
    global static String scheduleMe() {
        email_schedular schedulemail = new email_schedular(); 
        return System.schedule('My batch Job', cron, schedulemail);
    }
    global void execute(SchedulableContext sc) {
        batch_sendEmail b1 = new batch_sendEmail();
        ID batchprocessid = Database.executeBatch(b1,50);           
    }
}