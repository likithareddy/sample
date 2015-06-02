trigger restrictusers on Opportunity (before update) {
    for(Opportunity opp:trigger.new){
        if(trigger.oldmap.get(opp.Id).StageName=='ClosedWon'){
        opp.addError('You cannot edit the closed opportunities');
        }
    }
    
}