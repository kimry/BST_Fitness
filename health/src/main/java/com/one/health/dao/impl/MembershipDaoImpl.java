package com.one.health.dao.impl;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.health.dao.MembershipDao;
import com.one.health.dto.MembershipDto;

@Repository
public class MembershipDaoImpl implements MembershipDao {

	@Autowired
	SqlSession sqlSession;
	
	String namespace = "Membership.";
	

	@Override
	public boolean insertMembership(MembershipDto membership) {
		int cnt = sqlSession.insert(namespace + "insertMembership", membership);
		System.out.println(""+ sqlSession.insert(namespace + "insertMembership", membership));
		if(cnt>0)
		{
			return true;
		}
		return false;
	}
	
	@Override
	public boolean selectMembership(MembershipDto mbsId) {
		List<MembershipDto> mbs =  sqlSession.selectList(namespace + "selectMembership", mbsId);
		System.out.println("" + mbs + " " + mbsId.toString());	
		try {	//참
			mbs.get(0).toString().equals(mbsId.toString());
			return true;
			
		} catch (Exception e) { //거짓
			return false;
		} 
	}
	
	

	@Override
	public void updateMembershipDay(MembershipDto mbsId) {
		sqlSession.update(namespace + "updateMembershipDay", mbsId);
		
	}



	@Override
	public void updateMembershipMonth1(MembershipDto mbsId) {
		sqlSession.update(namespace + "updateMembershipMonth1", mbsId);
		
	}


	@Override
	public void updateMembershipMonth3(MembershipDto mbsId) {
		sqlSession.update(namespace + "updateMembershipMonth3", mbsId);
		
	}


	@Override
	public void updateMembershipMonth6(MembershipDto mbsId) {
		sqlSession.update(namespace + "updateMembershipMonth6", mbsId);
		
	}

	@Override
	public void updateMembershipYear(MembershipDto mbsId) {
		sqlSession.update(namespace + "updateMembershipYear", mbsId);
		
	}

	@Override
	public void updateMembership(MembershipDto mbsId) {
		sqlSession.update(namespace + "updateMembership", mbsId);
		
	}
	
	
	


	
}
