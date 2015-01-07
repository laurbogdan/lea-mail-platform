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

import com.lea.model.Mail;

public class MailRepositoryTest {

	@InjectMocks
	private MailRepository victim;
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
	public void shouldGetOutbox() {

		List<Mail> mails = createMailList();
		sessionFactory.getCurrentSession();
		when(sessionFactory.getCurrentSession()).thenReturn(session);
		when(session.createQuery(any(String.class))).thenReturn(query); //
		when(query.list()).thenReturn(mails);

		List<Mail> newMails = victim.getOutbox(0);

		assertEquals(newMails.size(), 2);
		assertEquals(newMails.get(0).getId(), "0");
		assertEquals(newMails.get(0).getMessage(), "Test mail 1");
		assertEquals(newMails.get(0).getFrom(), "Mos Craciun");
		assertEquals(newMails.get(1).getId(), "1");
		assertEquals(newMails.get(1).getMessage(), "Test mail 2");
		assertEquals(newMails.get(1).getFrom(), "Mos Nicolae");

	}

	@Test
	public void shouldGetInbox() {

		when(sessionFactory.getCurrentSession()).thenReturn(session);
		when(session.get(any(Class.class), any(Serializable.class)))
				.thenReturn(createMailList());

		List<Mail> mails = victim.getInbox(0);

		assertEquals(mails.size(), 2);
		assertEquals(mails.get(0).getId(), "0");
		assertEquals(mails.get(0).getMessage(), "Test mail 1");
		assertEquals(mails.get(0).getFrom(), "Mos Craciun");
		assertEquals(mails.get(1).getId(), "1");
		assertEquals(mails.get(1).getMessage(), "Test mail 2");
		assertEquals(mails.get(1).getFrom(), "Mos Nicolae");
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
