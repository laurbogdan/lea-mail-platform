package com.lea.model.response;

import java.io.Serializable;

import com.lea.model.User;

public class LoginResponse implements Serializable {
	private boolean success;
	private LoginErrors error;
	private User user;

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public LoginErrors getError() {
		return error;
	}

	public void setError(LoginErrors error) {
		this.error = error;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
