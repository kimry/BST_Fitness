package com.one.health.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(UsersDto user) {
		logger.info("UsersController login " + new Date());
		
		UsersDto dto = service.getUsers(user);
		if(dto!=null)
		{
			if(user.getId().equals(dto.getId())&&user.getPw().equals(dto.getPw()))
			{
				return "main";
			}
		}
		return "users/Login";
	}
	
}
