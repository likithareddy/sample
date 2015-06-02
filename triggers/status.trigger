trigger status on Case (before update) {
    for(Case cas:trigger.new){
    if(cas.Status!=trigger.oldMap.get(cas.Id).Status){
   Cas.Previous_Case_Status__c= trigger.oldMap.get(cas.Id).Status;
    }
}
}