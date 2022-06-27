trigger AutoNumberTestTrigger on AutoNumberTest__c (before insert) {
    new AutoNumberTestTriggerHandler().execute();
}