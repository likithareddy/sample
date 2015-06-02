trigger deleteallcontactsofaccount on Account (before insert) {
     List<string> myname=new List<string>();
     for(Account acc:trigger.new){
     myname.add(acc.Name);
    }
    
     List<Contact> con=[select id,Name from Contact where Name IN:myname];
     delete con;
}