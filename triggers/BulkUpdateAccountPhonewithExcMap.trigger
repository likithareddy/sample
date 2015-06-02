trigger BulkUpdateAccountPhonewithExcMap on Contact (after update) 
  {
    /*Set<Id> accIds=new Set<Id>();
    for(Contact c : trigger.newmap.values())
      accIds.add(c.AccountId);*/
    List<Account> accList=new List<Account>();
    
    /*List<Account> listOfAcc=[select phone from Account where ID IN : accIds];
    Map<id,Account> newAccmap=new Map<ID,Account>();
    for(Account a : listOfAcc)
     newAccMap.put(a.id,a);*/
    
    Map<id,Account> newAccmap=new Map<ID,Account>(
                              [select id,Phone 
                                    from Account where
                                     Id IN (select AccountID from Contact 
                                      where id In :trigger.new)]);
    
    integer outcount=0;
    integer incount=0;
    /*for(Account acc : listOfAcc)
      {
        outcount++;
        System.debug('------i am counting ---'+outcount);
        */
        for(Contact c : trigger.new)
          {
            Account acc=newAccMap.get(c.AccountId);
            acc.Phone=c.phone;
            accList.add(acc);
            /*inCount++;
           System.debug('------i am in counting ---'+incount);
            if(acc.id==c.AccountId)
              {
                acc.Phone=c.Phone;
                accList.add(acc);
                break;
              }*/
          }
        
    //  }
    update accList;
        
  }