//test class for test creation when customer is updated
@istest
public class CustomerUpdate{
public static testmethod void customerupdate(){

Customer__c cus=new Customer__c();
cus.Name='SobhaSankar';
cus.Name__c='Likitha';
cus.Phone__c='5642879542';
insert cus;

Test__c test=new Test__c();
test.Name=cus.Name;
test.Name__c=cus.Name__c;
test.Phone__c=cus.Phone__c;
test.Salary__c=cus.Salary__c;
insert test;

system.assertEquals(test.Name,cus.Name);
system.assertEquals(test.Salary__c,cus.Salary__c);

cus.Name='Anusha';


update cus;
}
}