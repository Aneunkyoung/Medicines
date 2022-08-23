package com.medicines.exception;

import com.medicines.dto.User;

public class DeleteAccountFailException extends Exception {
	private static final long serialVersionUID = 1L;
	
	private String id;
	
	public DeleteAccountFailException() {
		// TODO Auto-generated constructor stub
	}

	public DeleteAccountFailException(String message, String id) {
		super(message);
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
