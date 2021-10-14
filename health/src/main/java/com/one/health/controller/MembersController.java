package com.one.health.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.health.dto.MembersDto;
import com.one.health.service.MembersService;

@Controller
public class MembersController {
	
	private static Logger logger = LoggerFactory.getLogger(MembersController.class);
	
	@Autowired
	MembersService service;
	
	@RequestMapping(value = "mSignup.do")
	public String mSignup(HttpServletRequest req) {
		logger.info("MembersController mSignup " + new Date());
		
		MembersDto member = (MembersDto)req.getAttribute("member");
		service.insertMembers(member);
		return "users/login";
	}
}
