trigger Duplicateaccount on Account (before insert,before update) {
for(Account a:trigger.new)
{
system.debug('@@@@@@@@@@@@@@@@@'+a);
List<Account> acc=[select id from Account  where Name=:a.Name and Rating=:a.Rating];
system.debug('*********************************'+acc);
if(acc.size()>0){
a.Name.addError('You cannot create a duplicate record');
}
}
}