trigger automaticoppcreate on Account (before insert,after insert) {
    List<Opportunity> li=new List<Opportunity>();
    for(Account a:trigger.new){
   Opportunity opp=new Opportunity(Name=a.Name+'Opp',CloseDate=System.today()+90,StageName='Prospecting',Accountid=a.id);
   li.add(opp);
    }
    insert li;
}