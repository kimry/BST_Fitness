package com.one.health.dao.impl;

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
	
	
}
