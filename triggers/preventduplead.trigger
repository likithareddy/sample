trigger preventduplead on Lead (before insert,before update) {
    for(Lead l:trigger.new){
        if(l.Email!=null){
        List<Contact> dupes=[select Id,Email from Contact where Email=:l.Email];
        if(dupes.size()>0&&dupes!=null){
        l.addError('Duplicate Lead');
        }
        
        }
    
    }

}