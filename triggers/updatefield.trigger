trigger updatefield on Account (before insert,before update) {
    List<Account> accs=trigger.new;
    MyHelloWorld my=new MyHelloWorld();
    my.addHelloWorld(accs);   
}