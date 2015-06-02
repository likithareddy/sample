trigger updateNPSid on Stakeholder__c (after insert,after update) {
    List<id>conList=new List<id>();
    for(Stakeholder__c sh:trigger.new){
        conList.add(sh.Contact_Name__c);
    }
    List<Contact>lc=[select NPS_ID__c from Contact where Id IN:conList];
        for(Stakeholder__c sh:trigger.new){
            sh.NPS_ID1__c=lc[0].NPS_ID__c;
        }
}