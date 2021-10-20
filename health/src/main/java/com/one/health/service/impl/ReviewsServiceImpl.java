package com.one.health.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.health.dao.ReviewsDao;
import com.one.health.dto.ReviewsDto;
import com.one.health.dto.rDto;
import com.one.health.service.ReviewsService;

@Service
public class ReviewsServiceImpl implements ReviewsService {
	
	@Autowired
	ReviewsDao dao;

	@Override
	public boolean insertReviews(ReviewsDto review) {
		return dao.insertReviews(review);
	}

	@Override
	public List<ReviewsDto> getReviewList(String tid) {
		return dao.getReviewList(tid);
	}

	@Override
	public List<rDto> getReviewListO(String tid) {
		return dao.getReviewListO(tid);
	}

	@Override
	public ReviewsDto getReviews(int rnum) {
		return dao.getReviews(rnum);
	}

	@Override
	public boolean upRcm(int rnum) {
		return dao.upRcm(rnum);
	}

	@Override
	public boolean upOps(int rnum) {
		return dao.upOps(rnum);
	}
	
}
