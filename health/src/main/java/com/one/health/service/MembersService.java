package com.one.health.service;

import com.one.health.dto.MembersDto;

public interface MembersService {
	boolean insertMembers(MembersDto member);
	MembersDto getMembers(String mid);
}
