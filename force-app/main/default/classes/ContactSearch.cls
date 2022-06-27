public class ContactSearch {
	public static List<Contact> searchForContacts(String lastName,String mailingPostalCode){
        List<Contact> contacts = 
        [SELECT ID, Name, LastName, MailingPostalCode FROM Contact WHERE LastName = :lastName AND MailingPostalCode = :mailingPostalCode];
        System.debug('found contacts' + contacts);
        return contacts;
    }
}