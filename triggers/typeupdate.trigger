trigger typeupdate on Account (after insert) {
List<Account> acc=[select Type,NumberOfEmployees from Account];
List<Account> li=new List<Account>();
for(Account a:acc){
if(a.NumberOfEmployees>500){
a.Type='EnterPrise';
}
else
{
a.Type='Others';
}
li.add(a);
}
update li;
}