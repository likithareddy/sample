trigger addmember on Opportunity (after insert) {
    List<OpportunityTeamMember> opptm=new List<OpportunityTeamMember>();
    for(Opportunity opp:trigger.new){
        OpportunityTeamMember otm=new OpportunityTeamMember();
        //Opportunity n =[select Id,Name from Opportunity];
     // opptm.add(n);  
     otm.User=opp.Owner;
     otm.TeamMemberRole='Sales Rep';
     otm.OpportunityId=opp.Id;
     opptm.add(otm);
     
    }
    if(opptm.size()>0){
insert opptm;
}
}