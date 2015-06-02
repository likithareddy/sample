public class exm {
List<Account> account;
public List<Account> getaccount(){
account=[select Name,Phone from Account];
return account;
}
}