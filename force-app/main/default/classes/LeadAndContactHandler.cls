public class LeadAndContactHandler {
	public static Lead insertNewLead(String name){
        Lead re = new Lead();
        re.LastName = name;
        re.FirstName = 'Jerry';

    	try {
        	System.debug(re);
    		insert re;
		} catch (Exception e) {
    		return null;
		}
        {
            return re;
        }
    }
    
	public static Contact insertNewContact(String name){
        Contact re = new Contact();
        re.LastName = name;
        re.FirstName = 'Tom';

    	try {
        	System.debug(re);
    		insert re;
		} catch (Exception e) {
    		return null;
		}
        {
            return re;
        }
    }
}