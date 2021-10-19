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
import org.springframework.web.bind.annotation.RequestMethod;

import com.one.health.dto.MembersDto;
import com.one.health.dto.MembershipDto;
import com.one.health.service.MembersService;
import com.one.health.service.MembershipService;

@Controller
public class MembershipController {
	
	private static Logger logger = LoggerFactory.getLogger(MembershipController.class);
	
	@Autowired MembersService mService;
	
	@Autowired MembershipService mbsService;
	
	
	@RequestMapping(value = "moveMembership.do")
	public String moveMembership(Model model) {
		logger.info("MembershipController moveMembership " + new Date());
		
		model.addAttribute("content","reservations/membership.jsp");
		return "main";
	}
	
	
	@RequestMapping(value = "membership.do") 
	public String membership(Model model, int ptpoint, int flpoint, int price, String mbsId, String mbsName, int time) {
	logger.info("MembershipController membership " + new Date());

	
	try {	//신규 mbsService.insertMembership(membership);
		Date sdate = new Date();
		Date edate = sdate;
		mbsService.insertMembership(new MembershipDto(mbsId, mbsName, sdate, edate));
	} catch (Exception e) {	//기존 if(date > membership.getEdate()) { //연장
	}
	
	if(mbsService.selectMembership(new MembershipDto(mbsId))) {//멤버쉽이 끝난 기존회원
		mbsService.updateMembership(new MembershipDto(mbsId));
	}
	
	if(time == 1) {
		mbsService.updateMembershipDay(new MembershipDto(mbsId));
	}
	else if(time == 2) {
		mbsService.updateMembershipMonth1(new MembershipDto(mbsId));
	}
	else if(time == 3) {
		mbsService.updateMembershipMonth3(new MembershipDto(mbsId));
	}
	else if(time == 4) {
		mbsService.updateMembershipMonth6(new MembershipDto(mbsId));
	}
	else if(time == 5) {
		mbsService.updateMembershipYear(new MembershipDto(mbsId));
	}
	
	String mid = mbsId;
	System.out.println(mid+""+ptpoint+flpoint+price);
	mService.updateMembers(new MembersDto(mid, "", ptpoint, flpoint, 0, price));
	model.addAttribute("content","init.jsp");
	return "main";
	
	}
	
}


