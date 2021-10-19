package com.one.health.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.one.health.dto.MembersDto;
import com.one.health.dto.MembershipDto;
import com.one.health.dto.TrainnersDto;
import com.one.health.dto.UsersDto;
import com.one.health.service.MembersService;
import com.one.health.service.MembershipService;

@Controller
public class MembershipController {
	
	private static Logger logger = LoggerFactory.getLogger(MembershipController.class);
	
	@Autowired MembersService mService;
	
	@Autowired MembershipService mbsService;
	
	
	@RequestMapping(value = "moveMembership.do")
	public String moveMembership(Model model, HttpSession session) {
		UsersDto user = (UsersDto)session.getAttribute("login");
		if(user.getAuth()==1)
		{

			model.addAttribute("content","reservations/membership.jsp");
		}
		else if(user.getAuth()==2)
		{
			String temp="트레이너는 맴버쉽 페이지에 들어갈 수 없습니다.";
			model.addAttribute("msg",temp);
			return "redirect:/moveInit.do";
		}

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
	String temp="충전 정보가 저장되었습니다.";
	model.addAttribute("msg",temp);
	model.addAttribute("content","init.jsp");
	return "redirect:/moveInit.do";
	}
	
}


