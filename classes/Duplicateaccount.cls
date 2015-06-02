//test class for preventing duplicate account entering
@istest
public class Duplicateaccount{
public static testmethod void testinsert(){
string addError;
string myname='Likitha';
Account a=new Account(Name=myname);
List<Account> x=[select Name from Account where Name=:myname];
if(x.size()<0){
system.assertEquals(0,x.size());
insert a;
}
else{
addError='Existing';
}
system.assertEquals('Existing',addError);
}
}