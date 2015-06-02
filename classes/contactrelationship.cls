public class contactrelationship{
    public void updatecontactrelation(List<Contact> con){
        List<Contact_Relationship__c> conList=new List<Contact_Relationship__c>();
system.debug('-------------'+con);
        for(Contact cr:con){
            if(cr.Contact_Relationship__c==true){
            Contact_Relationship__c cn=new Contact_Relationship__c();
            cn.Name=cr.LastName;
            cn.Contact_Relationship__c=cr.id;
            conList.add(cn);
                
            }
            
        } 
        insert conList;
    }
}