package com.one.health.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.health.dao.TrainnersDao;
import com.one.health.dto.TrainnersDto;

@Repository
public class TrainnersDaoImpl implements TrainnersDao{

	@Autowired
	SqlSession sqlSession;

	String namespace = "Trainners.";

	@Override
	public boolean insertTrainners(TrainnersDto trainner) {
		int cnt = sqlSession.insert(namespace + "insertTrainners", trainner);
		if(cnt>0)
		{
			return true;
		}
		return false;
	}

	@Override
	public List<TrainnersDto> getTrainnerList() {
		return sqlSession.selectList(namespace+"getTrainnerList");
	}
	
	@Override
	public TrainnersDto getTrainner(String tid) {
		return sqlSession.selectOne(namespace+"getTrainner", tid);
	}

	@Override
	public List<TrainnersDto> getPTList() {
		return sqlSession.selectList(namespace+"getPTList");
	}

	@Override
	public List<TrainnersDto> getPLList() {
		return sqlSession.selectList(namespace+"getPLList");
	}
	
	
}
