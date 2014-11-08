package com.lea.repository;

import org.hibernate.SessionFactory;

public class MailRepository {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
