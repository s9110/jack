trigger trigger_bestPractise on Contact (before insert, before update) {
    Bestpractise instance=new Bestpractise();
    instance.contactTriggerMethod(trigger.new);
     }