trigger contactrelation on Contact (before insert,before update) {
    if(trigger.isAfter){
        if(trigger.isInsert){
            contactrelationship cp=new contactrelationship();
            cp.updatecontactrelation(trigger.New);
                
        }
    }
}