trigger ActiveCustomer on Customer_Project__c (before insert) {
 List<Opportunity> opps=new List<Opportunity>();
        for(Customer_Project__c cp:trigger.new){
            if(cp.Status__c=='Active'){
                Opportunity opp=new Opportunity(id=cp.id);
                opp.Active_Customer_Project__c=True;
                opps.add(opp);
            }
        }
        update opps;

}