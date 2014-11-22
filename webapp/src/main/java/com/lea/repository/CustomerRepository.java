package com.lea.repository;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.lea.model.User;

public class CustomerRepository {

	private SessionFactory sessionFactory;

	public User getUser(String username) {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"from User where username=:username");
		query.setParameter("username", username);
		List<User> results = query.list();
		if (results.isEmpty())
			return null;
		return results.get(0);
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
