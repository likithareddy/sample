trigger prefixmr on Account (before insert) {
    for(Account acc:trigger.new){
    
    acc.Name='Mr.'+acc.Name;
    }
    

}