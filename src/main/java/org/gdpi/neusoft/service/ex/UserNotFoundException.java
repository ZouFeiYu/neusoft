package org.gdpi.neusoft.service.ex;

public class UserNotFoundException extends RuntimeException{

	public UserNotFoundException() {
		super();
	}

	public UserNotFoundException(String msg) {
		super(msg);
	}
	
}
