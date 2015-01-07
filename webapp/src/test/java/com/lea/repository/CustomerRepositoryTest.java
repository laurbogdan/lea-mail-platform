package com.lea.repository;

import static org.junit.Assert.assertEquals;
import static org.mockito.Matchers.any;
import static org.mockito.Mockito.when;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.lea.model.User;

public class CustomerRepositoryTest {

	@InjectMocks
	private CustomerRepository victim;
	@Mock
	private SessionFactory sessionFactory;
	@Mock
	private Query query;
	@Mock
	private Session session;

	@Before
	public void setup() {

		MockitoAnnotations.initMocks(this);

	}

	@Test
	public void shouldGetUserByUsername() {

		List<User> users = createUsersList();
		sessionFactory.getCurrentSession();
		when(sessionFactory.getCurrentSession()).thenReturn(session);
		when(session.createQuery(any(String.class))).thenReturn(query);
		when(query.list()).thenReturn(users);

		User user = victim.getUserByUsername("laurentiu");

		assertEquals(user.getId(), 1);
		assertEquals(user.getUsername(), "laurentiu");

	}

	@Test
	public void shouldGetUserById() {

		when(sessionFactory.getCurrentSession()).thenReturn(session);
		when(session.get(any(Class.class), any(Serializable.class)))
				.thenReturn(createUsersList().get(0));

		User user = victim.getUserById(1);

		assertEquals(user.getId(), 1);
		assertEquals(user.getUsername(), "laurentiu");

	}

	private List<User> createUsersList() {
		List<User> users = new ArrayList<User>();
		User user = new User();
		user.setId(1);
		user.setUsername("laurentiu");
		users.add(user);

		return users;
	}

}
