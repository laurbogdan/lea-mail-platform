package com.lea.web.controller;

import java.sql.Timestamp;

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
	public ModelAndView mainPage() {
		ModelAndView model = new ModelAndView();
		model.setViewName("mainPage");
		return model;

	}

	@RequestMapping(value = { "/sendMail**" }, method = RequestMethod.PUT)
	public void sendMail() {

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

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public LoginResponse login(
			@RequestParam(value = "username", required = true) String username,
			@RequestParam(value = "password", required = true) String password) {
		// LoginResponse response = customerServcice.login(username, password);
		LoginResponse response = new LoginResponse();
		response.setSuccess(true);
		return response;

	}

}
