package com.lea.service;

import com.lea.model.User;
import com.lea.model.response.LoginErrors;
import com.lea.model.response.LoginResponse;
import com.lea.repository.CustomerRepository;

public class CustomerServiceImpl implements CustomerService {

	private CustomerRepository repository;

	public LoginResponse login(String username, String password) {
		User user = repository.getUser(username);
		LoginResponse response = new LoginResponse();
		if (user == null) {
			response.setSucces(false);
			response.setError(LoginErrors.USER_DOES_NOT_EXIST);
			return response;
		}
		if (!user.getPassword().equals(password)) {
			response.setSucces(false);
			response.setError(LoginErrors.INVALID_PASSWORD);
			return response;
		}
		response.setSucces(true);
		return response;
	}

	public void setRepository(CustomerRepository repository) {
		this.repository = repository;
	}

}
