public class Wrapperclass1 {
public List<Wrapperclass> temp{get;set;}
public boolean bool{get;set;}

public class wrapperclass{
public boolean ischecked{get;set;}
public Account a{get;set;}
public wrapperclass(Account a){
this.a=a;
} 

}

public Wrapperclass1(){
List<Account> acc=[select Name,Phone,Description,BillingAddress from Account];
temp=new List<Wrapperclass>();

if(acc.size()>0){
for(Account a:acc){
temp.add(new Wrapperclass(a));
}

}
}

public void deleteall(){
List<Account> delac=new List<Account>(); 
List<Wrapperclass> delwrap=new List<Wrapperclass>();

for(Wrapperclass w:temp){
if(w.ischecked){
delac.add(w.a);
}
else{
delwrap.add(w);
}

}
if(delac.size()>0){
delete delac;
temp=delwrap;
}
else{
ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'select atleast one Account to delete'));
}
}
public void selectall(){
if(bool){
for(Wrapperclass s:temp){
s.ischecked=true;
}
}
else{
for(Wrapperclass s:temp){
s.ischecked=false;
}
}


}

}