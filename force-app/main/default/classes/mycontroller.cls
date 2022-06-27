public class mycontroller {
  public String myString;
  
  public String getMyString() {return 'getMyString';}
  
  public String getStringMethod1(){return myString;}
  
  public String getStringMethod2(){
     System.debug('before Mystring=' + Mystring);
     if (MyString ==null)  Mystring='Method2';
     System.debug('after Mystring=' + Mystring);
     
     System.debug('before myString=' + myString);
     return myString;
  }
  
}