trigger capturedeactivationdate on User (before update) {
    Map<Id,User> usr=new Map<Id,User>();
        for(User u:trigger.new){
            if(u.IsActive=false){
            User us=usr.get(u.Id);
            if(us.IsActive=true)
            u.User_Deactive_State__c=u.LastModifiedDate;
            }
          }
            
        }