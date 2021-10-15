package com.one.health.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.health.dto.ReviewsDto;
import com.one.health.dto.TrainnersDto;
import com.one.health.service.ReviewsService;
import com.one.health.service.TrainnersService;

@Controller
public class TrainnersController {
	private static Logger logger = LoggerFactory.getLogger(TrainnersController.class);
	
	@Autowired
	TrainnersService tService;
	
	@Autowired
	ReviewsService rService;
	
	@RequestMapping(value = "moveTrainnerList.do")
	public String moveTrainnerList(Model model) {
		logger.info("TrainnersController moveTrainnerList " + new Date());
		
		List<TrainnersDto> trainnerList = tService.getTrainnersList();
		model.addAttribute("trainnerList",trainnerList);
		return "trainners/trainnerList";
	}
	
	@RequestMapping(value = "moveTrainnerView.do")
	public String moveTrainnerView(Model model, String tid) {
		logger.info("TrainnersController moveTrainnerView " + new Date());
		
		TrainnersDto trainner = tService.getTrainner(tid);
		List<ReviewsDto> reviewList = rService.getReviewList(); 
		model.addAttribute("trainner",trainner);
		model.addAttribute("reviewList", reviewList);
		return "trainners/trainnerView";
	}
	
	@RequestMapping(value = "moveReviewWrite.do")
	public String moveReviewWrite(Model model, String tid) {
		logger.info("TrainnersController moveReviewWrite " + new Date());
		
		TrainnersDto trainner = tService.getTrainner(tid);
		model.addAttribute("trainner",trainner);
		return "trainners/reviewWrite";
	}
	
	@RequestMapping(value="reviewWrite.do")
	public String reviewWrite(String title, String tid, String mid, int grade, String content) {
		logger.info("ReviewsController reviewWrite " + new Date());
		
		rService.insertReviews(new ReviewsDto(0, tid, mid, title, "", grade, content, 0, 0));
		return "redirect:/moveTrainnerView.do?tid="+tid;
	}
}
