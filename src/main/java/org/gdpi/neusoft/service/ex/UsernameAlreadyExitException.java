package org.gdpi.neusoft.service.ex;

/**
 * @author montreal
 *	用户名已经存在报错
 */
public class UsernameAlreadyExitException extends RuntimeException {

	public UsernameAlreadyExitException() {
		super();
	}

	public UsernameAlreadyExitException(String message) {
		super(message);
	}

}
