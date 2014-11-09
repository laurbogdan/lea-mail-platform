package com.lea.service;

import com.lea.model.Mail;
import com.lea.model.User;
import com.lea.repository.MailRepository;

public class MailServiceImpl implements MailService {

	private MailRepository repository;

	public void sendMail(Mail mail) {
		repository.addMail(mail);
	}

	public void addUser(User user) {
		repository.addUser(user);
	}

	public void setRepository(MailRepository repository) {
		this.repository = repository;
	}

}
