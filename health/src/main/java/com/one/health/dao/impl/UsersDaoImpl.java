package com.one.health.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.health.dao.UsersDao;
import com.one.health.dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao{
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "Users.";

	@Override
	public UsersDto getUsers(UsersDto user) {
		UsersDto dto = sqlSession.selectOne(namespace + "getUsers", user);
		return dto;
	}

	@Override
	public boolean insertUsers(UsersDto user) {
		int cnt = sqlSession.insert(namespace + "insertUsers", user);
		if(cnt>0)
		{
			return true;
		}
		return false;
	}
	
}
