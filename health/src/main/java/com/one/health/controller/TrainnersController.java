package com.one.health.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.health.dto.TrainnersDto;
import com.one.health.service.TrainnersService;

@Controller
public class TrainnersController {

	private static Logger logger = LoggerFactory.getLogger(MembersController.class);
	
	@Autowired
	TrainnersService service;
	
	@RequestMapping(value = "tSignup.do")
	public String tSignup(HttpServletRequest req) {
		logger.info("TrainnersController tSignup " + new Date());
		TrainnersDto trainner = (TrainnersDto)req.getAttribute("trainner");
		service.insertTrainners(trainner);
		return "users/login";
	}
	
	public String getTrainnerList(Model model) {
		logger.info("TrainnersController getTrainnerList " +new Date());
		
		model.addAttribute("trainnerList",service.getTrainnersList());
		return "trainners/trainnerList";
	}
	
}
