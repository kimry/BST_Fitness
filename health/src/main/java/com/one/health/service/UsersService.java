package com.one.health.service;

import com.one.health.dto.UsersDto;

public interface UsersService {
	
	UsersDto getUsers(String id);
	boolean insertUsers(UsersDto user);
	boolean updateUsers(UsersDto user);
}
