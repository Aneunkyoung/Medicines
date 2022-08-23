package com.medicines.exception;

public class FindIdFailException extends Exception{
	private static final long serialVersionUID = 1L;

	private String name;
	private String email;
	
	public FindIdFailException() {
		// TODO Auto-generated constructor stub
	}

	public FindIdFailException(String message, String name, String email) {
		super(message);
		this.name = name;
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
