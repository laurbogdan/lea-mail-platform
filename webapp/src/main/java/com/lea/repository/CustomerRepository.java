package com.lea.repository;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.lea.model.User;

public class CustomerRepository {

	private SessionFactory sessionFactory;

	public User getUserByUsername(String username) {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"from User where username=:username");
		query.setParameter("username", username);
		List<User> results = query.list();
		if (results.isEmpty())
			return null;
		return results.get(0);
	}

	public void addUser(User user) {
		sessionFactory.getCurrentSession().save(user);
	}

	public User getUserById(int id) {
		return (User) sessionFactory.getCurrentSession().get(User.class, id);
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
