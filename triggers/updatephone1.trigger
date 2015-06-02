trigger updatephone1 on Account (after update){
Account acc=trigger.new[0];
Contact con=[select Phone from Contact where Id =:trigger.new[0].Id];
con.Phone=trigger.new[0].Phone;
update con;
}