package com.lea.web.controller;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lea.model.Mail;
import com.lea.model.User;
import com.lea.service.CustomerService;
import com.lea.service.MailService;

@Controller
public class MainController {

	@Autowired
	private MailService mailService;
	@Autowired
	private CustomerService customerServcice;

	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {

		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		return model;
	}

	@RequestMapping(value = { "/sendMail**" }, method = RequestMethod.POST)
	public ModelAndView sendMail() {

		ModelAndView model = new ModelAndView();
		model.addObject("message", "Here you can send mail!");
		model.setViewName("mainPage");

		Mail mail = new Mail();
		mail.setId_user_from("2");
		mail.setId_user_to("1");
		mail.setId("100");
		mail.setMessage("Primul mail trimi din aplicatie");
		mail.setSubject("First mail");
		mail.setDate(new Timestamp(12132158));
		// mailService.sendMail(mail);

		User user = new User();
		user.setEmail("mail");
		user.setId("4");
		user.setPassword("123");
		user.setUsername("cristi");
		mailService.addUser(user);

		return model;
	}

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public ModelAndView login(
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password) {
		// LoginResponse response = customerServcice.login(username, password);
		ModelAndView model = new ModelAndView();
		// if (response.isSucces()) {
		// model.setViewName("mainPage");
		// } else {
		// model.setViewName("nologin");
		// }
		model.addObject("success", "true");
		model.setViewName("index");
		return model;

	}
}
