public class wrappercls {
public List<Account> acc{get;set;}

    public wrappercls(ApexPages.StandardController controller) {
    
    acc=[select Name,Phone,Industry from Account];
    

    }

}