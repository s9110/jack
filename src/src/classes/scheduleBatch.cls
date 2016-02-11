global class scheduleBatch implements Schedulable{

    public static String sched = '0 00 00 * * ?';  //Every Day at Midnight 

    global static String scheduleMe() {
        scheduleBatch SC = new scheduleBatch(); 
        return System.schedule('My batch Job', sched, SC);
    }

    global void execute(SchedulableContext sc) {

       batch_sendEmail b1 = new batch_sendEmail();
        ID batchprocessid = Database.executeBatch(b1,50);           
    }
}