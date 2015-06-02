trigger preventaccountdel on Account (before delete) {
List<Account> acc=trigger.old;
for(Account a:acc){
a.adderror('you cannot delete an account');
}
}