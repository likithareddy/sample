public with sharing class ServerSideDeviceDetection {

    public String a { get; set; }

    public String getAcc() {
        return null;
    }


    public String Account { get; set; }

   // public String Account { get; set; }
    List<Account> acc=new List<Account>();

    public PageReference cancel() {
        return null;
    }


    public PageReference save() {
        return null;
    }


    public boolean isIPhone {get;set;}

 
    public ServerSideDeviceDetection() {
    acc=[select Name,Phone,Description from Account];

         String userAgent = 

                System.currentPageReference().getHeaders().get('User-Agent');

         isIPhone = userAgent.contains('iPhone');

    }

 

    public PageReference detectDevice(){

        if (isIPhone)

            return Page.PhoneVersion.setRedirect(true);

        else

            return null;    

    }
}