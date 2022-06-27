public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String name){
        List<List<sObject>> searchList = [FIND :name IN ALL FIELDS 
                                          RETURNING Lead(FirstName,LastName),Contact(FirstName,LastName)];
        Lead[] searchLeads = (Lead[])searchList[0];
        Contact[] searchContacts = (Contact[])searchList[1];
        System.debug('Found the following leads.');
        for (Lead a : searchLeads) {
            System.debug(a.LastName + ', ' + a.FirstName);
        }
        System.debug('Found the following contacts.');
        for (Contact c : searchContacts) {
            System.debug(c.LastName + ', ' + c.FirstName);
        }
        return searchList;
    }
}