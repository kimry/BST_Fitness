package com.one.health.dao;

import java.util.List;

import com.one.health.dto.MembershipDto;

public interface MembershipDao {

	boolean insertMembership(MembershipDto membership);
	boolean selectMembership(MembershipDto mbsId);
	void updateMembershipDay(MembershipDto mbsId);
	void updateMembershipMonth1(MembershipDto mbsId);
	void updateMembershipMonth3(MembershipDto mbsId);
	void updateMembershipMonth6(MembershipDto mbsId);
	void updateMembershipYear(MembershipDto mbsId);
	void updateMembership(MembershipDto mbsId);
	

}
