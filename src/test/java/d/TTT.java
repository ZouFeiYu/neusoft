package d;

import java.util.Arrays;
import java.util.List;

import org.gdpi.neusoft.util.Power;

public class TTT {
public static void main(String[] args) {
	String power="[1,2,3,4]";
	List<Integer> i=Power.format(power);
	for(Integer l:i) {
		System.out.println(l);
	}
	
	String separatorChars=",";
	 String sepChars=separatorChars==null?",":separatorChars;
	    String[] splitChars = power.split(sepChars);
	    List<Integer> l = Arrays.asList(1,2,3,4); 
	    /* List<String> l=Arrays.asList(list); */
	    for(Object s:l) {
			System.out.println(s);
		}
	    if(l.contains(1)) {
	    	System.out.println("OK");
	    }else {
			System.out.println("ERR");
		}
}
}
