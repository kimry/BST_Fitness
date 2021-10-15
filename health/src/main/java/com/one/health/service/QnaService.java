package com.one.health.service;

import java.util.List;

import com.one.health.dto.QnaDto;
import com.one.health.dto.QnaParam;

public interface QnaService {

	List<QnaDto> getQnaList(QnaParam param);
	int getAllQna(QnaParam param);
	
	boolean qnaWrite(QnaDto qna);
	
	QnaDto getQna(int qnum);
	
	boolean qnaAnswer(QnaDto qna);
	
	void qnaChange(QnaDto qna);
	
	void deleteQna(int qnum);
}
