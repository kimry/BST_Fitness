package com.one.health.dao;

import java.util.List;

import com.one.health.dto.ReviewsDto;

public interface ReviewsDao {
	
	boolean insertReviews(ReviewsDto review);
	List<ReviewsDto> getReviewList(String tid);
	ReviewsDto getReviews(int rnum);
	boolean upRcm(int rnum);
	boolean upOps(int rnum);
}
