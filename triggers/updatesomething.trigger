trigger updatesomething on Account (after insert,after update) {
    if(utility.isFutureUpdate!=true){
        set<Id> idstoprocess=new set<Id>();
            for(Account acc:trigger.new){
                if(acc.No_Of_Locations__c>500){
                    idstoprocess.add(acc.Id);
                }
            }
            
                futuremethods.processLargeAccounts(idstoprocess);
    }

}