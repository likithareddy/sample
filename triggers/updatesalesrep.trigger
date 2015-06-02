trigger updatesalesrep on Account (before insert,before update) {
    set<id> setaccowner=new set<id>();
        for(Account acc:trigger.new){ 
          setaccowner.add(acc.OwnerId);  
        }
            Map<id,User>User_map=new Map<id,User>([select Name from User where id IN:setaccowner]);
                for(Account acc:trigger.new)
                {
                    User usr=User_map.get(acc.Ownerid);
                    acc.Sales_Rep__c=usr.Name;
                }
        
}