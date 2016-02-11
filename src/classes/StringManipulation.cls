public class StringManipulation {
	
	//public Integer intNumber {get;set;}	
    //pu/blic String strFibonacciSeries {get;set;}
    // function to print fibonacci series
	public void integerFibonacci(Integer integerLimit){
		
		Integer integerFirst=0;
		Integer integerSecond=1;
		Integer integerResult;
		string fibonacciSeries = '0 1 ';
		for(Integer j=0; j< integerLimit ; j++) {
            integerResult = integerFirst + integerSecond;
			integerFirst = integerSecond;
			integerSecond = integerResult;
			system.debug(integerResult);
			fibonacciSeries = fibonacciSeries + integerResult + ' ';
		}
		system.debug('strFibonacciSeries***********'+FibonacciSeries);
	}

//function to reverse the string
	public void stringReverse(String stringReverse){
		
		//String strOriginal ='abcd';
		String stringReversed = stringReverse.reverse();
		system.debug(stringReversed);
		
	}
// function to replace a character in a string
	public void stringReplace(String stringParameter){
		
		String strOld = 'Welcome to @pex Programming';
		String strNew = strOld.replace('@','A');
		system.debug(strNew);
	}

    // function to print substring of the string
	public void stringSubstring() {
		
		integer intIndex = 6;
		String strParameter ='*';
		String str1 = '*Welcome to @pex Programming*';
		String str2 = str1.substringBetween('W','*');
		system.debug('**** Sub String is: '+str2);
		
		 string str3 = str1.substring(intIndex);
		system.debug('**** Sub String is: '+str3);
		
		/*	String str1 = 'Welcome to @pex Programming';
			String str2 = str1.substring(11,27);
			system.debug('**** Sub String is: '+str2);
		    String str1 = 'Welcome to @pex Programming';
			String str2 = str1.substring(11,27);
			system.debug('**** Sub String is: '+str2);
		*/
	}
// function to add spaces in a string
	public void splitString(String strParameter){
	
		String stringComplete = 'Force.complatform';
		List<String> listString = stringComplete.split('.');
		System.debug(listString);
	}
// function to remaove spaces in a string 
	public void removeSpaces(String strParameter){
		String stringWithspace = ' Hello Jane ';
		String stringWithoutspace = stringWithspace.remove(' ');
		system.debug(stringWithoutspace);
	}
// function to convert  a string in a upper case 
	public void toupper(){
		
		String stringNormal = ' hello jane ';
		String stringUppercase = stringNormal.toUpperCase();
		system.debug(stringUppercase);
	}
// function to convert  a string in a lower case
	public void tolower(String strParameter){
		
		String stringOriginal = ' HELLO JANE ';
		String stringLowercase = stringOriginal.toLowerCase();
		system.debug(stringLowercase);
	}
}