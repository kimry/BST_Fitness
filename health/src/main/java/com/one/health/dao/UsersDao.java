package com.one.health.dao;

import com.one.health.dto.UsersDto;

public interface UsersDao {
	UsersDto getUsers(String id);
	boolean insertUsers(UsersDto user);
}