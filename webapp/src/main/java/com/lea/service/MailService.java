package com.lea.service;

import com.lea.model.Mail;
import com.lea.model.User;

public interface MailService {
	public void sendMail(Mail mail);

	public void addUser(User user);
}
