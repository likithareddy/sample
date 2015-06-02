trigger updateownername on Contact_Relationship__c(before update,before insert){
    set<Id> setOwner=new set<Id>();
        for(Contact_Relationship__c cr:trigger.new){
        setOwner.add(cr.OwnerId);
        }
    Map<Id,User> User_map=new Map<Id,User>([select Name from User where id IN:setOwner]);
        for(Contact_Relationship__c cr:trigger.new){
        User usr=User_map.get(cr.OwnerId);
        cr.Name=usr.Name;
        }
}