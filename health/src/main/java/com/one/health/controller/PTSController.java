package com.one.health.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.health.dto.PTSDto;
import com.one.health.dto.TrainnersDto;
import com.one.health.dto.UsersDto;
import com.one.health.service.PTSService;
import com.one.health.service.TrainnersService;

@Controller
public class PTSController {
	
	@Autowired
	TrainnersService tService;
	
	@Autowired
	PTSService ptService;
	
	@RequestMapping(value="moveReservationPT.do")
	public String moveReservationPT(Model model, HttpSession session) {
		UsersDto user = (UsersDto)session.getAttribute("login");
		System.out.println(user.getId() + " " +user.getAuth());
		if(user.getAuth()==1)
		{
			List<TrainnersDto> pt = tService.getPTList();
			List<TrainnersDto> pl = tService.getPLList();
			model.addAttribute("pt",pt);
			model.addAttribute("pl",pl);
			model.addAttribute("content","reservations/reservationPT.jsp");
		}
		else if(user.getAuth()==2)
		{
			String temp="트레이너는 PT예약 페이지에 들어갈 수 없습니다.";
			model.addAttribute("msg",temp);
			return "redirect:/moveInit.do";
		}
		return "main";
	}
	
	@RequestMapping(value="addPT.do")
	public String addPT(Model model, PTSDto pts) {
		System.out.println("tid : "+pts.getTid());
		if(ptService.getTime(pts)!=null)
		{
			String temp="이미 예약된 시간입니다.";
			model.addAttribute("msg",temp);
			return "redirect:/moveReservationPT.do";
		}
		ptService.insertPT(pts);
		model.addAttribute("content","init.jsp");
		return "main";
	}
}
