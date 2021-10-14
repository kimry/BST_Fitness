package com.one.health.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.one.health.dto.MembersDto;
import com.one.health.dto.UsersDto;
import com.one.health.service.UsersService;

@Controller
public class UsersController {
	
	private static Logger logger = LoggerFactory.getLogger(UsersController.class);
	
	@Autowired
	UsersService service;
	
	@RequestMapping(value = "moveLogin.do", method = RequestMethod.GET)
	public String moveLogin() {
		logger.info("UsersController moveLogin " + new Date());
		
		return "users/login";	
	}
	
	@RequestMapping(value = "moveSignup.do", method = RequestMethod.GET)
	public String moveSignup() {
		logger.info("UsersController moveSignup " + new Date());
		
		return "users/signup";	
	}
	
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(UsersDto user) {
		logger.info("UsersController login " + new Date());
		
		System.out.println(user.getId());
		UsersDto dto = service.getUsers(user);
		if(dto!=null)
		{
			if(user.getId().equals(dto.getId())&&user.getPw().equals(dto.getPw()))
			{
				return "main";
			}
		}
		return "users/login";
	}
	
	@RequestMapping(value = "signup.do", method = RequestMethod.POST)
	public String signup(Model model, UsersDto user) {
		logger.info("UsersController signup " + new Date());
		
		service.insertUsers(user);
		if(user.getAuth()==1)
		{
			return "redirect:/mSignup.do?id="+user.getId()+"&name="+user.getName();
		}
		else
		{
			return "redirect:/tSignup.do?id="+user.getId()+"&name="+user.getName();
		}
	}
	
}
