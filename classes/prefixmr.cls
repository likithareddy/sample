//test class for adding mr infront of account name
@istest
public class prefixmr{
public static testmethod void prefixmr(){
Account a=new Account(Name='Likitha');
a.Name='Mr.'+a.Name;
insert a;
}
}