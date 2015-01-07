package com.lea.web;

import static org.junit.Assert.assertEquals;
import static org.mockito.Matchers.any;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.lea.model.Mail;
import com.lea.model.User;
import com.lea.service.CustomerService;
import com.lea.service.MailService;
import com.lea.web.controller.MainController;

public class MainControllerTest {

	@InjectMocks
	private MainController victim;
	@Mock
	private CustomerService customerService;
	@Mock
	MailService mailService;

	@Before
	public void setup() {

		MockitoAnnotations.initMocks(this);
	}

	@Test
	public void shouldReverseTheList() {
		User user = new User();
		user.setUsername("Mos Craciun");
		user.setId(0);
		when(customerService.getUser(any(Integer.class))).thenReturn(user);
		when(mailService.getInbox(0)).thenReturn(createMailList());
		List<Mail> inbox = victim.getInbox(0);
		assertEquals(inbox.size(), 2);
		assertEquals(inbox.get(1).getId(), "0");
		assertEquals(inbox.get(1).getMessage(), "Test mail 1");
		assertEquals(inbox.get(1).getFrom(), "Mos Craciun");
		assertEquals(inbox.get(0).getId(), "1");
		assertEquals(inbox.get(0).getMessage(), "Test mail 2");
		assertEquals(inbox.get(0).getFrom(), "Mos Craciun");
	}

	private List<Mail> createMailList() {
		List<Mail> mails = new ArrayList<Mail>();
		Mail mail = new Mail();

		mail.setId("0");
		mail.setMessage("Test mail 1");
		mail.setFrom("Mos Craciun");

		mails.add(mail);

		mail = new Mail();

		mail.setId("1");
		mail.setMessage("Test mail 2");
		mail.setFrom("Mos Nicolae");

		mails.add(mail);

		return mails;
	}

}
