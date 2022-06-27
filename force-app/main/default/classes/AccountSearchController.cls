public with sharing class AccountSearchController {
    public String name {get;set;}
    public List<Account> results { get; set; }
    public AccountSearchController() {
        this.name = '';
        this.results = new List<Account>();
    }
    public PageReference doSearch() {
        try {
            String strSoqlQuery = 'select Name, Phone, Website from Account';
            String strName;
            If (String.IsNotBlank(this.name)) {
                strName = '%' + this.name + '%';
                strSoqlQuery = strSoqlQuery + ' where Name like :strName';
            }
            this.results = database.query(strSoqlQuery);
        } catch (Exception e){
             ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage()));
             return null;
        }

        return Page.AccountSearchResultPage;
    }

    public PageReference doPrevious(){
        return Page.AccountSearchPage;
    }
}