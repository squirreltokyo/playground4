public with sharing class AutoNumberTestTriggerHandler extends TriggerHandler {
    /**
     * @description before insert トリガーのハンドラ処理。
     * @param newList 対象データ。
     */
    public override void beforeInsert(List<SObject> newList) {
        // 対象データを取得する
        List<AutoNumberTest__c> autoNumberTestList = (List<AutoNumberTest__c>)newList;

        // Bulk採番処理
        List<String> controlNumberList = AutoNumberUtil.executeBulk(AutoNumberUtil.KUBUN01, newList.size());

        // 件数分により、採番番号を設定する
        for (Integer index=0; index<newList.size(); index++) {
            AutoNumberTest__c item = autoNumberTestList .get(index);
            item.AutoNumber__c = controlNumberList.get(index);
        }
    }
}