package com.one.health.dao;

import java.util.List;

import com.one.health.dto.ReviewsDto;
import com.one.health.dto.rDto;

public interface ReviewsDao {
	
	boolean insertReviews(ReviewsDto review);
	List<ReviewsDto> getReviewList(String tid);
	List<rDto> getReviewListO(String tid);
	ReviewsDto getReviews(int rnum);
	boolean upRcm(int rnum);
	boolean upOps(int rnum);
}
