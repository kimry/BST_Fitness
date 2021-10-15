package com.one.health.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.health.dao.QnaDao;
import com.one.health.dto.QnaDto;
import com.one.health.dto.QnaParam;

@Repository
public class QnaDaoImpl implements QnaDao {

	@Autowired
	SqlSession session;
	
	String ns = "Qna.";

	@Override
	public List<QnaDto> getQnaList(QnaParam param) {
		return session.selectList(ns + "qnalist", param);
	}

	@Override
	public int getAllQna(QnaParam param) {
		return session.selectOne(ns + "allqna", param);
	}

	@Override
	public boolean qnaWrite(QnaDto qna) {
		int n = session.insert(ns + "qnaWrite", qna);
		return n>0?true:false;
	}

	@Override
	public QnaDto getQna(int qnum) {
		return session.selectOne(ns + "getQna", qnum);
	}

	@Override
	public void readcount(int qnum) {
		session.update(ns + "readcount", qnum);
	}

	@Override
	public void qnaupdate(int qnum) {
		session.update(ns + "qnaupdate", qnum);
	}
	
	@Override
	public boolean qnaAnswer(QnaDto qna) {
		int n = session.insert(ns + "qnaAnswer", qna);
		return n>0?true:false;
	}

	@Override
	public void qnaChange(QnaDto qna) {
		session.update(ns+ "qnaChange",qna);
		
	}

	@Override
	public void deleteQna(int qnum) {
		session.update(ns + "deleteQna", qnum);
	}

	

	
	
	
}
