@isTest
public class UpdateHandoffAttached{
    static testmethod void HandoffAttached(){
        Account acc=new Account();
        acc.Name='test';
        insert acc;
        
        Opportunity opp=new opportunity();
        opp.Accountid=acc.id;
        opp.Name='Testdata';
        //Date myDate=Date.newinstance('2015,14,4');
        opp.CloseDate=system.today();
        opp.StageName='Prospecting';
        insert opp;
        
        Top_X_Designation__c t=new Top_X_Designation__c();
        t.Document_Attached__c=True;
        t.Type__c='Contract Flow Down/Hand Off';
        t.Opportunity__c=opp.id;
        insert t;
        Opportunity o1=[select Handoff_Attached__c from Opportunity where id=:opp.id];
        system.assertEquals('Yes',o1.Handoff_Attached__c);
        
        Opportunity t1=new Opportunity(id=opp.id);
        t.Document_Attached__c=False;
        t.Type__c='Contract Flow Down/Hand Off';
        t.Opportunity__c=opp.id;
        update t1;
        Opportunity o2=[select Handoff_Attached__c from Opportunity where id=:opp.id ];
        system.assertEquals('Yes',o2.Handoff_Attached__c);
        
        Opportunity o3=[select Handoff_Attached__c from Opportunity where id=:opp.id];
        system.assertEquals('Yes',o3.Handoff_Attached__c);
        
    }

}