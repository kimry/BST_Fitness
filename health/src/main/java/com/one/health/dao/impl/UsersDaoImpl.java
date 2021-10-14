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
		System.out.println(user.getId());
		UsersDto dto = sqlSession.selectOne(namespace + "getUsers", user);
		return dto;
	}
	
	

}
