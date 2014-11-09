package com.lea.repository;

import org.hibernate.SessionFactory;

import com.lea.model.Mail;
import com.lea.model.User;

public class MailRepository {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void addMail(Mail mail) {
		sessionFactory.getCurrentSession().save(mail);
	}

	public void addUser(User user) {
		sessionFactory.getCurrentSession().save(user);
	}
}
