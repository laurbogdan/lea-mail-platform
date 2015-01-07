package com.lea.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.when;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.lea.model.User;
import com.lea.model.response.LoginErrors;
import com.lea.model.response.LoginResponse;
import com.lea.repository.CustomerRepository;

public class CustomerServiceImplTest {

	@InjectMocks
	private CustomerServiceImpl victim;
	@Mock
	private CustomerRepository repository;

	@Before
	public void setup() {

		MockitoAnnotations.initMocks(this);

	}

	@Test
	public void shouldFailLoginWithInvalidPassword() {

		String username = "amihalca";
		String password = "fail";

		when(repository.getUserByUsername("amihalca")).thenReturn(createUser());

		LoginResponse response = victim.login(username, password);

		assertFalse(response.isSuccess());
		assertEquals(response.getError(), LoginErrors.INVALID_PASSWORD);

	}

	@Test
	public void shouldLoginWithSuccess() {

		String username = "amihalca";
		String password = "malware";
		User user = createUser();
		when(repository.getUserByUsername("amihalca")).thenReturn(user);

		LoginResponse response = victim.login(username, password);

		assertTrue(response.isSuccess());
		assertEquals(response.getUser(), user);

	}

	@Test
	public void shouldFailWithInexistentUser() {

		String username = "amihalca";
		String password = "malware";

		when(repository.getUserByUsername("amihalca")).thenReturn(null);

		LoginResponse response = victim.login(username, password);

		assertFalse(response.isSuccess());
		assertEquals(response.getError(), LoginErrors.USER_DOES_NOT_EXIST);

	}

	private User createUser() {

		User user = new User();
		user.setUsername("amihalca");
		user.setEmail("amihalca@yahoo.com");
		user.setId(1);
		user.setPassword("malware");

		return user;
	}

}
