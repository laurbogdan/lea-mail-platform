package com.lea.service;

import com.lea.repository.MailRepository;

public class MailServiceImpl implements MailService {

	private MailRepository repository;

	public void sendMail() {

	}

	public void setRepository(MailRepository repository) {
		this.repository = repository;
	}

}
