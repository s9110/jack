public  class Static_Demofinal 
{
    
     public integer demo2()
    {			
    	//integer n=10;
    	integer n= 10+ Static_demo.demo1();
 		return n;
    }
   public  void display()
    {
     	system.debug('the value after changing is '+demo2());
    }
}