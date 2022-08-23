package com.medicines.exception;

import com.medicines.dto.User;

public class ExistsEmailException extends Exception {
	private static final long serialVersionUID = 1L;
	
	private User user;
	
	public ExistsEmailException() {
		// TODO Auto-generated constructor stub
	}
	
	public ExistsEmailException(String message, User user) {
		super(message);
		this.user=user;
	}	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
