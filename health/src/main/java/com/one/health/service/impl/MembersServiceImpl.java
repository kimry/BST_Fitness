package com.one.health.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.health.dao.MembersDao;
import com.one.health.dto.MembersDto;
import com.one.health.service.MembersService;

@Service
public class MembersServiceImpl implements MembersService{

	@Autowired
	MembersDao dao;

	@Override
	public boolean insertMembers(MembersDto member) {
		return dao.insertMembers(member);
	}
	
	@Override
	public MembersDto getMembers(String mid) {
		return dao.getMembers(mid);
	}

	@Override
	public boolean updateMember(MembersDto member) {
		return dao.updateMember(member);
	}
	
	@Override
	public void updateMembers(MembersDto member) {
		dao.updateMembers(member);	
	}

	@Override
	public boolean downPt(String mid) {
		return dao.downPt(mid);
	}

	@Override
	public boolean downFl(String mid) {
		return dao.downFl(mid);
	}
	
}
