package org.gdpi.neusoft.service.ex;

public class PasswordNotMatchException extends RuntimeException{

	public PasswordNotMatchException() {
		super();
	}

	public PasswordNotMatchException(String message) {
		super(message);
	}

}
