package com.one.health.controller;

import java.util.Date;
import java.util.List;

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
	
	@RequestMapping(value = "moveTrainnerList.do")
	public String moveTrainnerList(Model model) {
		logger.info("TrainnersController moveTrainnerList " + new Date());
		
		List<TrainnersDto> trainnerList = service.getTrainnersList();
		model.addAttribute("trainnerList",trainnerList);
		return "trainners/trainnerList";
	}
	
	@RequestMapping(value = "moveTrainnerView.do")
	public String moveTrainnerView(Model model, String tid) {
		logger.info("TrainnersController moveTrainnerView " + new Date());
		
		System.out.println("tid : "+tid);
		TrainnersDto trainner = service.getTrainner(tid);
		model.addAttribute("trainner",trainner);
		return "trainners/trainnerView";
	}

	
}
