package il.ac.hit;

@SuppressWarnings("serial")
public class BusinessExceptionPlatrform extends Exception {
	
	public BusinessExceptionPlatrform(String exceptionMessage, Throwable throwable) 
	{
		super(exceptionMessage, throwable);
		
  	}
	
}
