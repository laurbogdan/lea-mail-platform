package com.lea.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Test");
		model.addObject("message", "This is default page!");
		model.setViewName("index");
		return model;
	}

	@RequestMapping(value = { "/sendMail**" }, method = RequestMethod.POST)
	public ModelAndView sendMail() {

		ModelAndView model = new ModelAndView();
		model.addObject("message", "Here you can send mail!");
		model.setViewName("sendMail");
		return model;
	}

}
