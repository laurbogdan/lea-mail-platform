package com.lea.repository;

import org.hibernate.SessionFactory;

import com.lea.model.Mail;

public class MailRepository {

	private SessionFactory sessionFactory;

	public void addMail(Mail mail) {
		sessionFactory.getCurrentSession().save(mail);
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
