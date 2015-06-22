public class deleterecords {
public List<Wrapperclass> liwc{get;set;}
public boolean bool{get;set;}

public class Wrapperclass{
public boolean checked{get;set;}
public invoice_statement__c inv{get;set;}
public Wrapperclass(invoice_statement__c inv){
this.inv=inv;

}
}
public deleterecords(){
liwc=new List<Wrapperclass>();
List<invoice_statement__c> s=[select Name,Status__c,Invoice_Total__c from invoice_statement__c];
if(s.size()>0)
{
for(invoice_statement__c inv : s){
liwc.add(new Wrapperclass(inv));
}
} 
}
public void del(){
List<invoice_statement__c> liinvfordel = new List<invoice_statement__c>(); 
List<Wrapperclass> litemwrap = new List<Wrapperclass>();
for(Wrapperclass w:liwc)
{
if(w.checked){
liinvfordel.add(w.inv);
}
else
{
litemwrap.add(w);
}
}
if(liinvfordel.size()>0){
delete liinvfordel;
liwc=litemwrap;
}
else{
ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'select atleast one invoice to delete'));
} 
}

public void selectall(){
if(bool){
for(Wrapperclass w:liwc){
w.checked=true;
}}
else
for(Wrapperclass w:liwc){
w.checked=false;
}
}
}