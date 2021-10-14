package com.one.health.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.health.dao.UsersDao;
import com.one.health.dto.UsersDto;
import com.one.health.service.UsersService;

@Service
public class UsersServiceImpl implements UsersService{

	
	@Autowired
	UsersDao dao;

	@Override
	public UsersDto getUsers(UsersDto user) {
		return dao.getUsers(user); 
	}

	@Override
	public boolean insertUsers(UsersDto user) {
		return dao.insertUsers(user);
	}
	

}
