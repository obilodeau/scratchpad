package org.bottomlesspit;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;

public class Exceptions {


	final static char[] buffer = new char[0x1000];
	
	/**
	 * haha not really ;)
	 * @throws IOException 
	 */
	static public String doingSomethingExceptional(String file) throws IOException {
		StringBuilder out = new StringBuilder();
		
		int read;
		Reader reader = new InputStreamReader(new FileInputStream(file), "UTF-8");
		
		do {
		  read = reader.read(buffer, 0, buffer.length);
		  if (read > 0) {
		    out.append(buffer, 0, read);
		  }
		}
		while (read >= 0);
		
		reader.close();
		return out.toString();
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		try {
			System.out.println(doingSomethingExceptional("expecting-exception"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println(e.getClass().toString());
			System.out.println(e.getClass().getCanonicalName());
			System.out.println(e.getClass().getName());
			System.out.println(e.getClass().getSimpleName());
		}
	}

}
