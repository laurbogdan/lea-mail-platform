package com.lea.service;

import java.util.List;

import com.lea.model.Mail;

public interface MailService {

	public void sendMail(Mail mail);

	public List<Mail> getInbox(int id);

	public List<Mail> getOutbox(int id);
}
