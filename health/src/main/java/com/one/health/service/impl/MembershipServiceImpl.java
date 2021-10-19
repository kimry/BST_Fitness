package com.one.health.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.health.dao.MembershipDao;
import com.one.health.dto.MembershipDto;
import com.one.health.service.MembershipService;

@Service
public class MembershipServiceImpl implements MembershipService {

	@Autowired
	MembershipDao dao;
	

	@Override
	public boolean insertMembership(MembershipDto membership) {
		return dao.insertMembership(membership);
	}
	

	@Override
	public void updateMembershipDay(MembershipDto mbsId) {
		dao.updateMembershipDay(mbsId);
		
	}


	@Override
	public void updateMembershipMonth1(MembershipDto mbsId) {
		dao.updateMembershipMonth1(mbsId);
		
	}


	@Override
	public void updateMembershipMonth3(MembershipDto mbsId) {
		dao.updateMembershipMonth3(mbsId);
		
	}


	@Override
	public void updateMembershipMonth6(MembershipDto mbsId) {
		dao.updateMembershipMonth6(mbsId);
		
	}


	@Override
	public void updateMembershipYear(MembershipDto mbsId) {
		dao.updateMembershipYear(mbsId);
		
	}


	@Override
	public boolean selectMembership(MembershipDto mbsId) {
		return dao.selectMembership(mbsId);
	}


	@Override
	public void updateMembership(MembershipDto mbsId) {
		dao.updateMembership(mbsId);
	}
	
	
	

}
