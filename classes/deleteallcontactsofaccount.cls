//test class for contact deletion on account with that name inserted
@istest
public class deleteallcontactsofaccount{

public static testmethod void deleteallcontactsofaccount(){
string myname='likitha';
Account acc=new Account(Name=myname);
Contact con=new Contact(LastName='Basireddy',FirstName='Likitha',AccountId=acc.Id);
insert con;

Contact c=[select Name,id from Contact where Name =:myname limit 1];
if(c!=null){
//system.assertEquals(c.Name=acc.Name);
delete c;
}
insert acc;
}
}