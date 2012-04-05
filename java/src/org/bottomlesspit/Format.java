package org.bottomlesspit;

import static java.text.MessageFormat.format;

public class Format {

    public static void cheapLog(String msg, Object... args) {
        System.out.println(format(msg, args));
    }

	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		cheapLog("Added request token {0} and request token secret {1}", "stuff", "otherStuff");
		cheapLog("Added request token {0} and request token secret {1}", "stuff", null);
	}

}
