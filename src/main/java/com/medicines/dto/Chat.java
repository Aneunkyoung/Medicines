package com.medicines.dto;

public class Chat {
	private int chatId;
	private String fromId;
	private String fromName;
	private String fromProfile;
	private String toId;
	private String toName;
	private String toProfile;
	private String chatContent;
	private String chatTime;
	private int chatRead;
	private String chatRoom;
	
	public Chat() {
		// TODO Auto-generated constructor stub
	}

	public int getChatId() {
		return chatId;
	}

	public void setChatId(int chatId) {
		this.chatId = chatId;
	}

	public String getFromId() {
		return fromId;
	}

	public void setFromId(String fromId) {
		this.fromId = fromId;
	}

	public String getFromName() {
		return fromName;
	}

	public void setFromName(String fromName) {
		this.fromName = fromName;
	}

	public String getFromProfile() {
		return fromProfile;
	}

	public void setFromProfile(String fromProfile) {
		this.fromProfile = fromProfile;
	}

	public String getToId() {
		return toId;
	}

	public void setToId(String toId) {
		this.toId = toId;
	}

	public String getToName() {
		return toName;
	}

	public void setToName(String toName) {
		this.toName = toName;
	}

	public String getToProfile() {
		return toProfile;
	}

	public void setToProfile(String toProfile) {
		this.toProfile = toProfile;
	}

	public String getChatContent() {
		return chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public String getChatTime() {
		return chatTime;
	}

	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}

	public int getChatRead() {
		return chatRead;
	}

	public void setChatRead(int chatRead) {
		this.chatRead = chatRead;
	}

	public String getChatRoom() {
		return chatRoom;
	}

	public void setChatRoom(String chatRoom) {
		this.chatRoom = chatRoom;
	}
	
}