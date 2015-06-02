trigger BulkAccountPhoneUpdate on Contact (after update) 
  {
    
    Set<Id> accIds=new Set<Id>();
    for(Contact c : trigger.newmap.values())
      accIds.add(c.AccountId);
    List<Account> accList=new List<Account>();
   List<Account> listOfAcc=[select phone from Account where ID IN : accIds];
    integer outcount=0;
    integer incount=0;
    for(Account acc : listOfAcc)
      {
        outcount++;
        System.debug('------i am counting ---'+outcount);
        for(Contact c : trigger.new)
          {
           inCount++;
           System.debug('------i am in counting ---'+incount);
            if(acc.id==c.AccountId)
              {
                acc.Phone=c.Phone;
                accList.add(acc);
                break;
              }
          }
        
      }
    update accList;
        
  }