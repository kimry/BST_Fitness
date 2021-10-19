package com.one.health.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.health.dao.PTSDao;
import com.one.health.dto.PTSDto;

@Repository
public class PTSDaoImpl implements PTSDao{
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace ="PTS.";
	@Override
	public boolean insertPT(PTSDto pts) {
		int cnt = sqlSession.insert(namespace + "insertPT", pts);
		return cnt>0?true:false;
	}
	@Override
	public List<PTSDto> getTimeList(PTSDto pts) {
		return sqlSession.selectList(namespace+"getTimeList",pts);
	}
	
	@Override
	public PTSDto getTime(PTSDto pts) {
		return sqlSession.selectOne(namespace+"getTime",pts);
	}
	@Override
	public List<PTSDto> getTodayList(String mid) {
		return sqlSession.selectList(namespace+"getTodayList", mid);
	}
	@Override
	public List<PTSDto> getUpcomingList(String mid) {
		return sqlSession.selectList(namespace+"getUpcomingList", mid);
	}
	@Override
	public List<PTSDto> getPastList(String mid) {
		return sqlSession.selectList(namespace+"getPastList", mid);
	}
	

}
