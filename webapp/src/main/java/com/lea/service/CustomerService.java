package com.lea.service;

import com.lea.model.User;
import com.lea.model.response.LoginResponse;

public interface CustomerService {

	public LoginResponse login(String username, String password);

	public void addUser(User user);

	public User getUser(String id);
}
