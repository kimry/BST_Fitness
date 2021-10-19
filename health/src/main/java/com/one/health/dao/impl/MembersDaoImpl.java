package com.one.health.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.health.dao.MembersDao;
import com.one.health.dto.MembersDto;

@Repository
public class MembersDaoImpl implements MembersDao{

	@Autowired
	SqlSession sqlSession;
	
	String namespace = "Members.";

	@Override
	public boolean insertMembers(MembersDto member) {
		int cnt = sqlSession.insert(namespace + "insertMembers", member);
		if(cnt>0)
		{
			return true;
		}
		return false;
	}
	
	@Override
	public MembersDto getMembers(String mid) {
		return sqlSession.selectOne(namespace + "getMembers", mid);
	}

	@Override
	public boolean updateMember(MembersDto member) {
		int cnt = sqlSession.update(namespace+"updateMember", member);
		if(cnt>0)
		{
			return true;
		}
		return false;
	}
	
	@Override
	public void updateMembers(MembersDto member) {
		sqlSession.update(namespace + "updateMembers", member);
		
	}

	@Override
	public boolean downPt(String mid) {
		int cnt = sqlSession.update(namespace + "downPt",mid);
		if(cnt>0)
		{
			return true;
		}
		return false;
	}

	@Override
	public boolean downFl(String mid) {
		int cnt = sqlSession.update(namespace + "downFl",mid);
		if(cnt>0)
		{
			return true;
		}
		return false;
	}
	
	

}
