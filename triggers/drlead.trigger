trigger drlead on Lead (before insert,after update) {
List<Lead> li=trigger.new;
for(Lead l:li){
    l.FirstName='Dr.'+l.FirstName;
}

}