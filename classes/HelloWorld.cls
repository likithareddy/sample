@istest
private class HelloWorld{
    static testMethod void MyHelloWorld(){
    Account a=new Account();
    a.Name='Test';
    insert a;
    a=[select Hello__c from Account where id=:a.id];
    system.assertEquals('World',a.Hello__c);
    }
}