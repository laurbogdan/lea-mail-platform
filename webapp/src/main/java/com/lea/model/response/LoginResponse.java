package com.lea.model.response;

import com.lea.model.User;

public class LoginResponse {
	private boolean succes;
	private LoginErrors error;
	private User user;

	public boolean isSucces() {
		return succes;
	}

	public void setSucces(boolean succes) {
		this.succes = succes;
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
