package com.one.health.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.one.health.dto.QnaDto;
import com.one.health.dto.QnaParam;
import com.one.health.dto.UsersDto;
import com.one.health.service.QnaService;
import com.one.health.service.UsersService;


@Controller
public class QnaController {

	private static Logger logger = LoggerFactory.getLogger(QnaController.class);

	@Autowired
	QnaService qservice;
	@Autowired
	UsersService uservice;
	
	@RequestMapping(value = "qnalist.do", method = RequestMethod.GET)
	public String qnalist(Model model, QnaParam param) {
		logger.info("QnaController qnalist " + new Date());
		
		
		int pageNumber = 0;
		if (param != null) { // 매개변수로 넘어 온 값이 있으면..
			pageNumber = param.getPageNumber();
		}
		model.addAttribute("pageNumber", pageNumber);

		int start, end;
		start = 1 + 10 * pageNumber;
		end = 10 + 10 * pageNumber;

		param.setStart(start);
		param.setEnd(end);

		List<QnaDto> list = qservice.getQnaList(param);
		model.addAttribute("qnalist", list);

		model.addAttribute("choice", param.getChoice());
		model.addAttribute("search", param.getSearch());

		// 총 글의 수 갖고오기
		int allqna = qservice.getAllQna(param);
		// 총 페이지 수
		int qnaPage = allqna / 10; // 29 / 10 -> 2
		System.out.println(qnaPage);
		if ((allqna % 10) > 0) {
			qnaPage = qnaPage + 1;
		}
		System.out.println(qnaPage);
		model.addAttribute("qnaPage", qnaPage);
						
		return "qna/qnalist";		
	}
	
	@RequestMapping(value = "moveQnawrite.do", method = RequestMethod.GET)
	public String qnawrite(Model model) {
		logger.info("QnaController qnawrite " + new Date());
		
		return "qna/qnawrite";
	}
	
	@RequestMapping(value = "qnawriteAf.do", method = RequestMethod.POST)
	public String qnawriteAf(QnaDto qna) {
		logger.info("QnaController qnawriteAf " + new Date());
		
		boolean b = qservice.qnaWrite(qna);
		if(b == true) {
			return "redirect:/qnalist.do"; // controller
		}
		
		return "qna/qnawrite"; //view
	}
	
	
	@RequestMapping(value = "qnadetail.do", method = RequestMethod.GET)
	public String qnadetail(int qnum, Model model,HttpSession session, HttpServletRequest req) {
		logger.info("QnaController bbsdetail " + new Date());
		
		QnaDto qna = qservice.getQna(qnum);
		UsersDto dto = (UsersDto)session.getAttribute("login");
		
		model.addAttribute("qna",qna);
		model.addAttribute("user", dto);
		model.addAttribute("qnum", qnum);
		
		return "qna/qnadetail";
	}
	
	@RequestMapping(value = "moveQnaAnswer.do", method = RequestMethod.GET)
	public String qnaaswer(int qnum, Model model) {
		logger.info("QnaController qnaaswer " + new Date());
		
		QnaDto qna = qservice.getQna(qnum);
		
		model.addAttribute("qna", qna);
		model.addAttribute("qnum", qnum);
		
		return "qna/qnaanswer";
	}
	
	@RequestMapping(value = "qnaanswerAf.do", method = RequestMethod.POST)
	public String qnaanswerAf(int qnum, QnaDto qna) {
		logger.info("QnaController qnaanswerAf " + new Date());
		
		boolean b = qservice.qnaAnswer(qna);
		
		if(b== true) {
			return "redirect:/qnalist.do";
		}
		
		return "qna/qnalist";
	}
	
	@RequestMapping(value = "qnaupdate.do", method = RequestMethod.GET)
	public String qnaUpdate(int qnum, Model model) {
		logger.info("QnaController qnaupdate " + new Date());
		
		QnaDto qna = qservice.getQna(qnum);
		
		model.addAttribute("qna", qna);
		
		return "qna/qnaupdate";
	}
	
	@RequestMapping(value = "qnaupdateAf.do", method = RequestMethod.POST)
	public String qnaupdateAf(QnaDto qna) {
		
		qservice.qnaChange(qna);
		
		return "redirect:/qnalist.do";
	}
	
	@RequestMapping(value = "qnadelete.do", method = RequestMethod.GET)
	public String qnadelete(int qnum) {
		
		qservice.deleteQna(qnum);
		
		return "redirect:/qnalist.do";
	}
}
































