public class TemperatureConverter {
    // Takes a Fahrenheit temperature and returns the Celsius equivalent.
    public static Decimal FahrenheitToCelsius(Decimal fh) {
       
        Account acc = new Account( );
        Database.insert(acc, false);
        System.debug('======insert=====');
        
        InnerClass tt = new InnerClass();
        tt.myMethod();
        
        Subclass subc = new Subclass();
        subc.printName();
        
        Account theAccount;
        try {
            system.debug( 'Querying Accounts.');
            theAccount = [SELECT Id FROM Account WHERE CreatedDate > TODAY] ;
        }
        catch (QueryException eX) {
            system.debug('Query Exception. ');
        } 
        finally {
            system.debug('Done. ');
        }
        
        
        try{
            List<Account> retrievedRecords = [SELECT Id FROM Account WHERE Website = '123456'];
            System.debug('###try###');
            System.debug('retrievedRecords size=' + retrievedRecords.size());
            if(retrievedRecords.size() == 0)
            {
                //System.assert(false);
            }
        }catch(Exception e){
            //manage excception logic
            System.debug('###excception###');
            //System.assert(false);
        }
        
        try {
            Account myAccount = [SELECT id, name FROM Account WHERE name = 'ABC'];
        }
        catch (Exception e) {
            System.debug('Exception caught');
        }
        System.debug('Continuing');
        string myString = 'Salesforce';
        System.debug('String size is ' + myString.length());
        
        String name = 'squirrel';
        String qryName = '%' + String.escapeSingleQuotes(name) + '%';
        System.debug('print the qryName:'+ qryName);
        
        Double x1 = 35;
        
        Try{
        List<id> idList;
        Account a;
        Insert a;
        Id acctId = a.Id;
        idList.add( acctId );
		}catch ( ListException le) {
        System.debug ('List Exception');
		}catch ( NullPointerException npe ) {
        System.debug (' NullPointer Exception');
		}catch ( Exception e ) {
        System.debug (' Generic Exception');
		}
        
        Decimal theValue; 
        System.debug (theValue);
        
        Integer c = [SELECT Count() FROM Account WHERE Name = 'for loop 1' OR Name = 'for loop 2' OR Name = 'for loop 3'];
        Integer r = Limits.getQueryRows();
        System.debug('c=' + c + ' and ' + 'r=' + r);
        
        Integer x; 
        for(x=0; x<10; x+=2)
        {
            system.debug('i=' + x); 
            if(x==8) break; 
            if(x==10) break;
        }
        system.debug('X=' + x); 
        
        Integer z = 5; 
        do{
            z=z+1;
        }while (z<= 15); 
        System.debug('Z=' + z);
        
        Decimal cs = (fh - 32) * 5/9;
        return cs.setScale(2);
   }
    
  // Inner interface
  public virtual interface MyInterface { 
 
    // No access modifier is necessary for interface methods - these are always 
    // public or global depending on the interface visibility
    void myMethod(); 
  }
  
  public virtual class InnerClass implements MyInterface {
 
    // Instance method that implements a method from MyInterface.
    // Because it is declared virtual it can be overridden by a subclass.
    public virtual void myMethod() {
       System.debug ('virtual method >>>');
    }
  }
   
  public virtual class SuperClass {
    public String mySalutation;
    public String myFirstName;
    public String myLastName;
 
    public SuperClass() {
 
        mySalutation = 'Mr.';
        myFirstName = 'Carl';
        myLastName = 'Vonderburg';
    }
 
    public SuperClass(String salutation, String firstName, String lastName) {
          
          mySalutation = salutation;
          myFirstName = firstName;
          myLastName = lastName;
      }
      
      public virtual void printName() {
          
          System.debug('My name is ' + mySalutation + myLastName);
      }
      
      public virtual String getFirstName() {
          return myFirstName;
      }
  }
    
    public class Subclass extends Superclass {
        public override void printName() {
            super.printName();
            System.debug('But you can call me ' + super.getFirstName());
        }
    }
   
}