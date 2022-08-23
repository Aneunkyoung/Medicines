package com.medicines.exception;

public class FindPasswordFailException extends Exception{
	private static final long serialVersionUID = 1L;

	private String id;
	private String email;
	
	public FindPasswordFailException() {
		// TODO Auto-generated constructor stub
	}

	public FindPasswordFailException(String message, String id, String email) {
		super(message);
		this.id = id;
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
