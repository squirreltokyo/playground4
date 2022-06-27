public without sharing class AutoNumberUtil {
    public static String KUBUN01 = '1001';
    public static List<String> executeBulk(String kubun, Integer size) {
        List<String> newValueList = new List<String>();
        AutoNumberMaster__c currentAutoNumberMaster = getCurrentAutoNumberMaster(kubun);
        String oldValue = currentAutoNumberMaster.Value__c;
        String newValue;
        for (Integer index=0; index < size; index++) {
            switch on kubun {
                when '1001' { newValue = bizLogicKubun01(oldValue); }
            }
            newValueList.add(newValue);
            oldValue = newValue;
        }
        AutoNumberMaster__c autoNumberMaster = new AutoNumberMaster__c();
        autoNumberMaster.Code__c = kubun;
        autoNumberMaster.Value__c = newValue;
        upsert autoNumberMaster Code__c;
        return newValueList;
    }
    private static String bizLogicKubun01(String oldValue) {
        String template = '{0}-{1}';
        List<Object> parameters = new List<Object>();
        String parameter0 = System.now().format('yyyyMMdd');
        parameters.add(parameter0);
        String parameter1 = '0001';
        if (String.isNotBlank(oldValue)) {
            List<String> autoNumberParts = oldValue.split('-');
            if (parameter0.equals(autoNumberParts.get(0))) {
                Long autoNumberSuffix = long.valueOf(autoNumberParts.get(1)) + 1;
                if (autoNumberSuffix <= 999) {
                    parameter1 = ('0000' + String.valueOf(autoNumberSuffix)).right(4);
                } else {
                    parameter1 = String.valueOf(autoNumberSuffix);
                }
            }
        }
        parameters.add(parameter1);
        return String.format(template, parameters);
    }
    private static AutoNumberMaster__c getCurrentAutoNumberMaster(String kubun) {
        List<AutoNumberMaster__c> autoNumberMasterList = [SELECT Code__c, Value__c FROM AutoNumberMaster__c WHERE Code__c = :kubun FOR UPDATE];
        if (autoNumberMasterList.isEmpty()) {
            return new AutoNumberMaster__c();
        }
        return autoNumberMasterList.get(0);
    }
}