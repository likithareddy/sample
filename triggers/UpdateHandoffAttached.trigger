trigger UpdateHandoffAttached on Top_X_Designation__c (after insert,after update,after delete) {
   
   List<Opportunity> opp=new List<Opportunity>();
   List<Opportunity> objopp=new List<Opportunity>();
   
   set<Id> setopp=new set<Id>();
   set<Id> objsetopp=new set<Id>(); 
   
   map<Id,Id> docattactrue=new map<Id,Id>();
   map<Id,Id> docattactfalse=new map<Id,Id>();
   map<Id,Id> docdelete=new map<Id,Id>();
   
       if(trigger.isInsert||trigger.isupdate){
           for(Top_X_Designation__c top:trigger.new){
               system.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'+top);
               if(top.Type__c=='Contract Flow Down/Hand Off' && top.Document_Attached__c==True){
               docattactrue.put(top.Opportunity__c,top.Id);
               objsetopp.add(top.Opportunity__c);
               
               }
               else{
               docattactfalse.put(top.Opportunity__c,top.Id);
               objsetopp.add(top.Opportunity__c);
               
               }
           }
               if(trigger.isdelete){
               for(Top_X_Designation__c top:trigger.old){
               docdelete.put(top.Opportunity__c,top.Id);
               objsetopp.add(top.Opportunity__c);
               setopp.add(top.Opportunity__c);
               }
               }
               objopp=[select Handoff_Attached__c,Id from Opportunity where Id IN : objsetopp];
               system.debug('#########################################################'+objopp);
               if(objopp.size()>0 && objopp!=null){
               for(Opportunity nopp:objopp){
               system.debug('********************************************************'+nopp);
               if(docattactrue.containsKey(nopp.Id)){
               nopp.Handoff_Attached__c='yes';
               }
               
               if(docattactfalse.containsKey(nopp.Id)){
               
               nopp.Handoff_Attached__c='No';
               
               }
               if(docdelete.containsKey(nopp.Id)){
               nopp.Handoff_Attached__c='';
               }
               opp.add(nopp);
               }
               }
               if(opp.size()>0 && opp.size()!=null){
               update opp;
               system.debug('################HAI LIKITHA HERE IS THE VARIABLE VALUE################'+opp);
               }
       }
       
   
}