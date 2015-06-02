trigger CustomerUpdate on Customer__c (before update) {

List<Test__c> tes=new List<Test__c>();
    for(Customer__c cus:trigger.old){
    Test__c t=new Test__c();
    t.Name=cus.Name;
    t.Name__c=cus.Name__c;
    t.Phone__c=cus.Phone__c;
    t.Salary__c=cus.Salary__c;
    tes.add(t);
    }
    insert tes;

}