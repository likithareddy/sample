public class Emailsending {
private final Account account{get;set;}
public string subject{get;set;}
public string body{get;set;}


    public Emailsending(){
    account=[select Name,(select Contact.Name,Contact.Email from Account.Contacts) from Account where id=:ApexPages.currentPage().getParameters().get('id')];
    }
    
    
    public Account getAccount(){
    return account;
    }
    
    
   public PageReference sendemail(){
   Messaging.SingleEmailMessage Email=new Messaging.SingleEmailMessage();
   
   string addresses;
   if(account.Contacts[0].Email != null){
   addresses=account.Contacts[0].Email;
   for(Integer i=0;i<account.Contacts.size();i++){
   if(account.Contacts[i].Email!=null){
   addresses+=':'+account.Contacts[i].Email;
   }
   }
 
   }
   string[] toaddresses=addresses.split(':',0);
   email.setSubject(subject);
   email.setToAddresses(toAddresses);
   email.setPlainTextBody(body);
   
   Messaging.SendEmailResult[] r=Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
   return null;
   }
   
}