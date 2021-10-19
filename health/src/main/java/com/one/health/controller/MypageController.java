package com.one.health.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.one.health.dto.MembersDto;
import com.one.health.dto.TrainnersDto;
import com.one.health.dto.UsersDto;
import com.one.health.service.MembersService;
import com.one.health.service.TrainnersService;
import com.one.health.service.UsersService;

@Controller
public class MypageController {
;
	
	@Autowired
	MembersService mservice;
	
	@Autowired
	TrainnersService tservice;
	
	@Autowired
	UsersService uservice;
	
	private static Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping(value="moveMypage.do")
	public String moveMypage(Model model, HttpSession session) {
		logger.info("MypageController moveMypage " + new Date());
		UsersDto user = (UsersDto)session.getAttribute("login");
		
		if(user.getAuth()==1)
		{
			return "redirect:/moveMemberMypage.do";
		}
		if(user.getAuth()==2)
		{
			return "redirect:/moveTrainerMypage.do";
		}
		model.addAttribute("content","init.jsp.jsp");
		return "main";
	}
	
	@RequestMapping(value = "moveTrainerMypage.do", method = RequestMethod.GET)
	public String trainerMypage(HttpSession session, Model model) {
		
		logger.info("MypageController moveTrainerMypage " + new Date());
		
		UsersDto user = (UsersDto)session.getAttribute("login");
		
		String tid = user.getId();
		
		TrainnersDto trainner = tservice.getTrainner(tid);
		
		model.addAttribute("user", user);
		model.addAttribute("trainner", trainner);
		
		model.addAttribute("content","mypage/tmypage.jsp");
		return "main";
	}
	
	@RequestMapping(value = "moveUpdateTrainner.do", method = RequestMethod.GET)
	public String moveUpdateTrainner(String id, Model model) {
		
		logger.info("MypageController moveUpdateTrainner " + new Date());
		
		String tid = id;
		
		UsersDto user = uservice.getUsers(id);
		
		TrainnersDto trainner = tservice.getTrainner(tid);
		model.addAttribute("user", user);
		model.addAttribute("trainner", trainner);
		
		model.addAttribute("content","mypage/updatetmypage.jsp");
		return "main";
	}
	
	@RequestMapping(value = "UpdateTrainnerAf.do", method = RequestMethod.POST)
	public String UpdateTrainnerAf(UsersDto user, TrainnersDto trainner, HttpSession session, HttpServletRequest req) {
		
		logger.info("MypageController moveUpdateTrainner " + new Date());
		
		uservice.updateUsers(user);
		tservice.updateTrainner(trainner);
		UsersDto dto = uservice.getUsers(user.getId());
		req.getSession().setAttribute("login", dto);
		
		return "redirect:/moveTrainerMypage.do";
		
	}
	
	@RequestMapping(value = "moveMemberMypage.do", method = RequestMethod.GET)
	public String moveMemberMypage(HttpSession session, Model model) {
		
		logger.info("MypageController moveMemberMypage " + new Date());
		
		UsersDto user = (UsersDto)session.getAttribute("login");
		
		String mid = user.getId();
		MembersDto member = mservice.getMembers(mid);
		
		model.addAttribute("user", user);
		model.addAttribute("member", member);
		
		model.addAttribute("content","mypage/mmypage.jsp");
		return "main";
	}
	
	@RequestMapping(value = "moveUpdateMember.do", method = RequestMethod.GET)
	public String moveUpdateMember(String id, Model model) {
		
		logger.info("MypageController moveUpdateMember " + new Date());
		
		String mid = id;
		
		UsersDto user = uservice.getUsers(id);
		MembersDto member = mservice.getMembers(mid);
		
		model.addAttribute("user", user);
		model.addAttribute("member", member);
		
		model.addAttribute("content","mypage/updatemmypage.jsp");
		return "main";
	}
	
	@RequestMapping(value = "UpdateMemberAf.do", method = RequestMethod.POST)
	public String UpdateMemberAf(UsersDto user, MembersDto member, HttpSession session, HttpServletRequest req) {
		
		logger.info("MypageController UpdateMemberAf " + new Date());
		
		uservice.updateUsers(user);
		mservice.updateMember(member);
		UsersDto dto = uservice.getUsers(user.getId());
		req.getSession().setAttribute("login", dto);
		
		return "redirect:/moveMemberMypage.do";
		
	}
	
	@RequestMapping(value = "upload.do", method = RequestMethod.POST)
	public String upload(@RequestParam(value = "fileload", required = false) MultipartFile fileload, HttpServletRequest req) {
		
		// filename(원본)취득
		UsersDto user = (UsersDto)req.getSession().getAttribute("login");
		String filename = user.getId()+".jpg";
		System.out.println(filename);
		
		// upload 경로설정
		// server(tomcat) <- 진짜!
		String fupload = req.getServletContext().getRealPath("/resources/images/trainer");
		
		System.out.println("fupload:" + fupload);
		
		// 파일명이 충돌되지 않도록 파일명을 변경
		File file = new File(fupload + "/" + filename); 
				
		try {
			// 폴더에 실제 업로드
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			
		} catch (IOException e) {			
			e.printStackTrace();
		}		
				
		return "redirect:/moveMypage.do";
	}
}





















