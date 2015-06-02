trigger comparefields on Lead (after update) {
    Map<Id,Lead> l=new Map<Id,Lead>();
    l=trigger.oldMap;
        for(Lead ld:trigger.new){
           Lead n=new Lead();
           n=l.get(ld.Id);
           if(n.Status!=n.Status){
           
           n.Status.addError('Email cannot be changed');
  
           }
           
        
        }
}