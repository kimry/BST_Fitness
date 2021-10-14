package com.one.health.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.one.health.dto.MembersDto;
import com.one.health.service.MembersService;

@Controller
public class MembersController {
	
	private static Logger logger = LoggerFactory.getLogger(MembersController.class);
	
	@Autowired
	MembersService service;
	
	@RequestMapping(value = "mSignup.do", method = RequestMethod.GET)
	public String mSignup(String id, String name) {
		logger.info("MembersController mSignup " + new Date());
		
		MembersDto member = new MembersDto(id,name,0,0,0,0);
		service.insertMembers(member);
		return "users/login";
	}
}
