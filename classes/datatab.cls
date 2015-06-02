public class datatab {
public List<Account> acc;
public List<Account> getaccount(){
acc=[select Name,Phone,Type from Account];
return acc;
}
}