public class FutureMethods{
    @Future
        public static void processLargeAccounts(set<Id> accIds){
            List<Account> acctoupdate=new List<Account>();
                utility.isFutureUpdate=true;
                    update acctoupdate;
        }
}