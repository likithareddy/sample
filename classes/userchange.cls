global class userchange implements Database.Batchable<Sobject>{

    public string query='SELECT id, name, ownerId FROM Account WHERE ownerId = :fromUser.id';
    
        global Database.QueryLocator Start(Database.BatchableContext BC){
        
            return Database.getQueryLocator(query);
            
        }
            global void Execute(Database.BatchableContext BC,List<Account> Scope){
            
           

            
            }
                global void finish(Database.BatchableContext BC){
                
                AsyncApexJob a = [Select Id, Status, NumberOfErrors, JobItemsProcessed,TotalJobItems, CreatedBy.Email from AsyncApexJob where Id =:BC.getJobId()];
                
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                
                String[] toAddresses = new String[] {'likithabasireddy@gmail.com','likithareddy306@gmail.com'};
                
                mail.setToAddresses(toAddresses);
                
                mail.setSubject('Test Batch ' + a.Status);
                
                mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems +' batches with '+ a.NumberOfErrors + ' failures.');
                
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

                }
}