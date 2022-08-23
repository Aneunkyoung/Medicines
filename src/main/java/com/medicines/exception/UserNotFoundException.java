package com.medicines.exception;

import com.medicines.dto.User;

public class UserNotFoundException extends Exception {
	private static final long serialVersionUID = 1L;
	
	private User user;
	
	public UserNotFoundException() {
		// TODO Auto-generated constructor stub
	}

	public UserNotFoundException(String message, User user) {
		super(message);
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
