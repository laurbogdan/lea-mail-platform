package com.lea.model;

public class Mail {

	private String id;
	private String subject;
	private String message;
	private String id_user_to;
	private String id_user_from;
	private boolean is_read;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getId_user_to() {
		return id_user_to;
	}

	public void setId_user_to(String id_user_to) {
		this.id_user_to = id_user_to;
	}

	public String getId_user_from() {
		return id_user_from;
	}

	public void setId_user_from(String id_user_from) {
		this.id_user_from = id_user_from;
	}

	public boolean isIs_read() {
		return is_read;
	}

	public void setIs_read(boolean is_read) {
		this.is_read = is_read;
	}

}
