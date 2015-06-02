trigger updatephone on Contact (after update,after insert){
Contact con=trigger.new[0];
Account acc=[select Phone from Account where Id =:trigger.new[0].AccountId];
acc.Phone=trigger.new[0].Phone;
update acc;
}