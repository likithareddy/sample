trigger attachlead on Lead (after update) {
  List<Attachment> attach=new List<Attachment>();
  system.debug('@@@@@@@@@@@@@@@@'+attach);
  List<Attachment>attlst=new List<Attachment>();
  system.debug('#############################'+attlst);
  set<Id> lids=new set<Id>();
  system.debug('********************************'+lids);
  for(Lead l:trigger.new){
  system.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&'+l);
  if(l.isconverted){
  lids.add(l.Id);
  }    
  }
  if(lids.size()>0){
  attach=[select Name,Body,ContentType,Id from Attachment where Id IN :lids];
  system.debug('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'+attach);
  } 
  if(attach.size()>0){
  for(Attachment a:attach){
  Attachment newatt=a.clone();
  newatt.Id=trigger.newMap.get(a.Id).ConvertedAccountId;
  attlst.add(newatt);
  
  }
  } 
  insert attlst;  
}