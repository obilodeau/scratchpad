package org.bottomlesspit;

public class Exceptions {


	/**
	 * doingSomethingExceptional
	 * 
	 * haha not really ;)
	 * @throws Exception 
	 */
	static public String doingSomethingExceptional() throws Exception {
		throw new Exception("exceptional");
	}
	
	/**
	 * doingSomethingExceptionalAtRunTime
	 * 
	 * @throws RuntimeException 
	 */
	static public String doingSomethingExceptionalAtRunTime(){
		throw new RuntimeException("exceptional while running");
	}

	
	/**
	 * @param args
	 */
	public static void main(String[] args) {

		System.out.println("Doing exceptional stuff today! First, a checked exception:");
		// compiler forces me to try-catch
		try {
			doingSomethingExceptional();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println(e.getClass().toString());
			System.out.println(e.getClass().getCanonicalName());
			System.out.println(e.getClass().getName());
			System.out.println(e.getClass().getSimpleName());
		}

		System.out.println("\nThen a catching an unchecked exception:");
		try {
			doingSomethingExceptionalAtRunTime();
		} catch (Exception e) {
			System.out.println(e.getClass().getName());			
		}

		System.out.println("\nThen we hit a unchecked exception at runtime:");
		doingSomethingExceptionalAtRunTime();
	}

}
