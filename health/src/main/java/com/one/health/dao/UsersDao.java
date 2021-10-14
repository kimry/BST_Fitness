package com.one.health.dao;

import com.one.health.dto.UsersDto;

public interface UsersDao {
	UsersDto getUsers(UsersDto user);
	boolean insertUsers(UsersDto user);
}
