trigger contactcreation on Account (after insert,after update) {
    List<contact> con=new List<contact>();
    Map<id,decimal> acclst=new Map<id,decimal>();
    
        for(Account acc:trigger.new){
        acclst.put(acc.id,acc.No_Of_Locations__c);
        }
            if(acclst.size()>0&&acclst!=null){
            for(id accid:acclst.keyset()){
                for(integer i=0;i<acclst.get(accid);i++){
                    contact c=new contact();
                    c.accountid=accid;
                    c.LastName='contac'+i;
                    con.add(c);
                   
                }
            }
         }
    if(con.size()>0&&con!=null){
    insert con;
    }
        
        
}