trigger restrictattachsize on Attachment (before insert,before update) {
    List<Attachment> attach=new List<Attachment>();
    for(Attachment att:trigger.new){
    if(att.Body.size()>314){
    att.addError('Your limit has been exceeded');
    }
}
}