trigger createattach on Books__c (after insert) {
List<Attachment> attach=new List<Attachment>();
for(Books__c book:trigger.new){
Attachment att=new Attachment();
att.Name=book.Name;
att.ContentType='Text/Plain';
att.Id=book.Id;
att.Body=Blob.valueOf(book.Name+'added successfully');
attach.add(att);
}
insert attach;
}