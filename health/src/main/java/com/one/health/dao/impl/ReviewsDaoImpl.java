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
	public List<ReviewsDto> getReviewList() {
		return sqlSession.selectList(namespace + "getReviewList");
	}
	
	
}
