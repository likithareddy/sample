trigger addaccountteam on Opportunity (after insert,after update) {

List<AccountShare> accsh=new List<AccountShare>();
List<AccountTeamMember> acctm=new List<AccountTeamMember>();


/*if (acctm.size() > 0)
{                  
   // Insert new Account Team Members (ATM).
   insert acctm;
   // We can't actually set the access level on the ATM insert;
   // we have to modify the AccountShare records that were
   // automatically and INVISIBLY created with a default of 'Read'.
   list <AccountShare> s = 
      [SELECT Id, AccountId, UserOrGroupId, AccountAccessLevel
         FROM AccountShare
        WHERE AccountId IN :accountIds
          AND UserOrGroupId IN :userIds
          AND AccountAccessLevel != 'Edit'];
   if (s.size() > 0)
   {
      // Update these records with a new Account Access Level.
      for (AccountShare a : shares)
      {
         a.AccountAccessLevel = 'Edit';
      }
      update s;
   }
} */      

for(Opportunity opp:trigger.new){
if(opp.Probability==50){

AccountTeamMember team=new AccountTeamMember();
team.AccountId=opp.accountId;
team.UserId=opp.OwnerId;

AccountShare share=new AccountShare();
//share.accountId=opp.accountId;
//share.AccountAccessLevel='Read/Write';
//share.OpportunityAccessLevel='Read only';
//share.CaseAccessLevel='Read Only';
//accsh.add(share);
acctm.add(team);
}

}
if(acctm!=null){
insert acctm;
}

if(accsh!=null&&accsh.size()>0){
//insert accsh;
}


}