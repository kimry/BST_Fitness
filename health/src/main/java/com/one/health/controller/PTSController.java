package com.one.health.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.health.dto.PTSDto;
import com.one.health.dto.TrainnersDto;
import com.one.health.service.PTSService;
import com.one.health.service.TrainnersService;

@Controller
public class PTSController {
	
	@Autowired
	TrainnersService tService;
	
	@Autowired
	PTSService ptService;
	
	@RequestMapping(value="moveReservationPT.do")
	public String moveReservationPT(Model model) {
		List<TrainnersDto> pt = tService.getPTList();
		List<TrainnersDto> pl = tService.getPLList();
		model.addAttribute("pt",pt);
		model.addAttribute("pl",pl);
		return "reservations/reservationPT";
	}
	
	@RequestMapping(value="addPT.do")
	public String addPT(PTSDto pts) {
		
		ptService.insertPT(pts);
		return "main";
	}
}
