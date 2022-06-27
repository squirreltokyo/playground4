public class AccountHandler {
    public static Account insertNewAccount(String name){
        Account re = new Account();
        re.Name = name;

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