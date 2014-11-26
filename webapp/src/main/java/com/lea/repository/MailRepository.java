package com.lea.repository;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.lea.model.Mail;

public class MailRepository {

	private SessionFactory sessionFactory;

	public void addMail(Mail mail) {
		sessionFactory.getCurrentSession().save(mail);
	}

	public List<Mail> getInbox(String id) {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"from Mail where id_user_to=:id_user_to");
		query.setParameter("id_user_to", id);
		List<Mail> results = query.list();

		return results;
	}

	public List<Mail> getOutbox(String id) {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"from Mail where id_user_from=:id_user_from");
		query.setParameter("id_user_from", id);
		List<Mail> results = query.list();

		return results;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
