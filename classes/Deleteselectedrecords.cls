public class Deleteselectedrecords {
Public List<invoice_statement__c> li{get;set;}
public string Fetchrecords{get;set;}
Public Deleteselectedrecords(){
li=new List<invoice_statement__c>();
li=[select name,Status__c,Invoice_Total__c,Description__c from invoice_statement__c];
}
public void FetchRecords(){
li=[select name,Status__c,Invoice_Total__c,Description__c from invoice_statement__c]; 
}
}