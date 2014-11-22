package com.lea.service;

import com.lea.model.response.LoginResponse;

public interface CustomerService {

	public LoginResponse login(String username, String password);
}
