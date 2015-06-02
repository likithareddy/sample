trigger SendEmail on Books__c (after insert) {
List<attachment> attach=new List<attachment>();
for(Books__c bok:trigger.new){
    attachment a=new attachment();
    a.ParentId=bok.Id;
    a.Name=bok.Name;
    a.ContentType='text/plain';
    a.Body=Blob.valueOf(bok.Name+'is added successfully');
    attach.add(a);
}
insert attach;
}