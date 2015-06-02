trigger PostFeed on Opportunity(after insert, after update) {
    List<FeedItem> FIList = new List<FeedItem>();
    Map<Id, Opportunity> oldMap = trigger.oldMap;
    for(Opportunity oppty: trigger.new) {
        FeedItem FI = new FeedItem();
        if(trigger.isInsert && oppty.StageName == 'Closed Won') {
            FI.Body = 'Opportunity is closed successfully on ' + system.today() + ' by ' + UserInfo.getName();
        } else if(trigger.isUpdate) {
            Opportunity tempOppty = oldMap.get(oppty.Id);
            if(tempOppty.StageName != oppty.StageName && oppty.StageName == 'Closed Won') {
                FI.Body = 'Opportunity is closed successfully on ' + system.today() + ' by ' + UserInfo.getName();
            }
        }
        FI.ParentId = oppty.Id;
        if(String.isNotBlank(FI.Body)){
            FIList.add(FI);
        }
    }
    if(FIList.size() > 0) {
        insert FIList;
    }
}