package com.one.health.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.one.health.dto.TrainnersDto;
import com.one.health.service.TrainnersService;

@Controller
public class TrainnersController {

	private static Logger logger = LoggerFactory.getLogger(MembersController.class);
	
	@Autowired
	TrainnersService service;
	
	@RequestMapping(value = "tSignup.do", method = RequestMethod.GET)
	public String tSignup(String id, String name) {
		logger.info("TrainnersController tSignup " + new Date());
		
		TrainnersDto trainner = new TrainnersDto(id,name,0,"입력해주세요","입력해주세요");
		service.insertTrainners(trainner);
		return "users/login";
	}
	
}
