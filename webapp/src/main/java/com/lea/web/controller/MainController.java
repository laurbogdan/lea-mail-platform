package com.lea.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lea.model.Mail;
import com.lea.model.User;
import com.lea.model.response.LoginResponse;
import com.lea.service.CustomerService;
import com.lea.service.MailService;

@Controller
public class MainController {

	@Autowired
	private MailService mailService;
	@Autowired
	private CustomerService customerServcice;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView welcome() {
		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		return model;

	}

	@RequestMapping(value = "mainPage", method = RequestMethod.GET)
	public ModelAndView mainPage(
			@RequestParam(value = "id", required = true) String id) {
		ModelAndView model = new ModelAndView();
		User user = customerServcice.getUser(id);
		model.addObject("user", user);
		model.setViewName("mainPage1");
		return model;

	}

	@RequestMapping(value = { "/sendMail" }, method = RequestMethod.PUT)
	public void sendMail(
			@RequestParam(value = "idFrom", required = true) String idFrom,
			@RequestParam(value = "to", required = true) String to,
			@RequestParam(value = "subject", required = true) String subject,
			@RequestParam(value = "text", required = true) String text) {

		Mail mail = new Mail();
		mail.setId_user_from(idFrom);
		mail.setId_user_to(customerServcice.getUserByUsername(to).getId());
		mail.setIs_read(false);
		mail.setSubject(subject);
		mail.setMessage(text);

		mailService.sendMail(mail);

	}

	@RequestMapping(value = { "/sendMail" }, method = RequestMethod.PUT)
	public void registerUser(
			@RequestParam(value = "username", required = true) String username,
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "mail", required = true) String mail) {

		User user = new User();
		user.setEmail(mail);
		user.setUsername(username);
		user.setPassword(password);

		customerServcice.addUser(user);

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public LoginResponse login(
			@RequestParam(value = "username", required = true) String username,
			@RequestParam(value = "password", required = true) String password) {
		return customerServcice.login(username, password);

	}

	@RequestMapping(value = "/inbox", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Mail> getInbox(
			@RequestParam(value = "id", required = true) String id) {
		for (int i = 0; i < 10; i++)
			System.out.println(id);
		return mailService.getInbox(id);

	}

	@RequestMapping(value = "/outbox", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Mail> getOutbox(
			@RequestParam(value = "id", required = true) String id) {
		return mailService.getOutbox(id);

	}

}
