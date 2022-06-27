public with sharing class ContactListController {
    // 【ViewState確認用】
    private String v1 = '11';

    // 【ViewState確認用：transient】
    transient public String v2 = '22';

    // 【ViewState確認用：Static】
    public Static String v3 = '33';

    // 検索条件
    public Contact condition{ get;set; }

    // 検索結果リスト
    public List<Contact> results { get;set; }

    /**
     * コンストラクタ
     */
    public ContactListController() {
        this.condition = new Contact();
        this.results = new List<Contact>();
    }

    /**
     * クリアボタン処理
     */
    public PageReference clear(){
        this.condition = new Contact();
        this.results = new List<Contact>();
        return null;
    }

    /**
     * 検索ボタン処理
     */
    public PageReference search() {
        try {
            system.debug('condition:' + condition);

            // 入力チェック
            If (String.IsBlank(condition.EMail) && String.IsBlank(condition.AccountId)) {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'メールまたは取引先名のいずれかを入力してください。'));
                return null;
            }

            // 検索条件からSOQLを作成
            String strSoqlQuery = 'select Name, AccountId, Phone, Email from Contact where Id != null ';

            // メール
            String strEMail;
            If (!String.IsBlank(condition.EMail)) {
                strEMail = '%' + condition.EMail + '%';
                strSoqlQuery = strSoqlQuery + ' and EMail like :strEMail';
            }

            // 取引先名
            String strAccountId;
            If (!String.IsBlank(condition.AccountId)) {
                strAccountId = condition.AccountId;
                strSoqlQuery = strSoqlQuery + ' and AccountId =:strAccountId';
            }

            // 対象データを検索する
            system.debug('strSoqlQuery:'+ strSoqlQuery);
            this.results = database.query(strSoqlQuery);
        } catch (Exception e){
             ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage()));
        } 
        return null;
    }
}