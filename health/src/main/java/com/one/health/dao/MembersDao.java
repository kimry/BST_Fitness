package com.one.health.dao;

import com.one.health.dto.MembersDto;

public interface MembersDao {
	
	boolean insertMembers(MembersDto member);
	MembersDto getMembers(String mid);
	boolean updateMember(MembersDto member);
	void updateMembers(MembersDto member);
}
