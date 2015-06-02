trigger PreventDuplicateContacts  on Contact (before insert) 
  {
    /*Contact c=trigger.new[ ];
    List<Contact> listOfCon=[select id from Contact where Email=:c.Email];
    if(!listOfCon.isEmpty())
      {
       c.addError('Contact already exist with this email');
      }*/
      
    Set<String> allEmails=new Set<String>();
    for(Contact c :trigger.new)
      {
        if(!allEmails.contains(c.Email))//(mahender,a,b,c,b,c)
           allEmails.add(c.email);
        else
          c.Email.addError('in new list already email is there');
      }    
    
    List<Contact> listOfCon=[select id,name,email from COntact
                             where email In : allEmails];//(b@gmail.com,c@gmail.com)
    //{mahender}
    set<String> duplicateEmails=new Set<String>();
    for(Contact c: listOfCon)
      duplicateEmails.add(c.Email);//{mahender}
    for(Contact c: trigger.new) //mahender,a,b,c,b,
     {
        if(duplicateEmails.Contains(c.email))
         c.Email.addError('Email already exist');
     }
     
     
       
  }