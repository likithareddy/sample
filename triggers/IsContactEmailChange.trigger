trigger IsContactEmailChange  on Contact (after update) 
  {
    Map<id,Contact> oldContactRecord=trigger.oldMap;
    
    For(Contact c : trigger.new)
      {
        Contact con=oldContactRecord.get(c.id);
        if(c.Email!=con.Email)
          c.Email.addError('Email Can\'t be change from trigger');
      
      }}