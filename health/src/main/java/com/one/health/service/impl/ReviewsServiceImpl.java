package com.one.health.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.health.dao.ReviewsDao;
import com.one.health.dto.ReviewsDto;
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
	public List<ReviewsDto> getReviewList() {
		return dao.getReviewList();
	}
	
}
