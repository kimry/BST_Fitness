package com.one.health.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.health.dao.ReviewsDao;
import com.one.health.dto.ReviewsDto;

@Repository
public class ReviewsDaoImpl implements ReviewsDao{

	@Autowired
	SqlSession sqlSession;
	
	String namespace = "Reviews.";
	
	@Override
	public boolean insertReviews(ReviewsDto review) {
		int cnt = sqlSession.insert(namespace + "insertReviews", review);
		if(cnt>0)
		{
			return true;
		}
		return false;
	}

	@Override
	public List<ReviewsDto> getReviewList(String tid) {
		return sqlSession.selectList(namespace + "getReviewList",tid);
	}

	@Override
	public ReviewsDto getReviews(int rnum) {
		return sqlSession.selectOne(namespace+"getReviews",rnum);
	}

	@Override
	public boolean upRcm(int rnum) {
		int cnt = sqlSession.update(namespace+"upRcm",rnum);
		if(cnt>0)
		{
			return true;
		}
		return false;
	}

	@Override
	public boolean upOps(int rnum) {
		int cnt = sqlSession.update(namespace+"upOps",rnum);
		if(cnt>0)
		{
			return true;
		}
		return false;
	}
}
