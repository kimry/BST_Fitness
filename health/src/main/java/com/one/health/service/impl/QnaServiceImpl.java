package com.one.health.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.health.dao.QnaDao;
import com.one.health.dto.QnaDto;
import com.one.health.dto.QnaParam;
import com.one.health.service.QnaService;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	QnaDao dao;

	@Override
	public List<QnaDto> getQnaList(QnaParam param) {
		return dao.getQnaList(param);
	}

	@Override
	public int getAllQna(QnaParam param) {
		return dao.getAllQna(param);
	}

	@Override
	public boolean qnaWrite(QnaDto qna) {
		return dao.qnaWrite(qna);
	}

	@Override
	public QnaDto getQna(int qnum) {
		dao.readcount(qnum);
		
		return dao.getQna(qnum);
	}

	@Override
	public boolean qnaAnswer(QnaDto qna) {
		dao.qnaupdate(qna.getQnum());
		
		return dao.qnaAnswer(qna);
	}

	@Override
	public void qnaChange(QnaDto qna) {
		
		dao.qnaChange(qna);
	}

	@Override
	public void deleteQna(int qnum) {
		dao.deleteQna(qnum);
	}

}
