trigger Discounttrigger on Books__c (before insert,before update) {
    List<Books__c> books=trigger.new;
    discount.price(books);   
}