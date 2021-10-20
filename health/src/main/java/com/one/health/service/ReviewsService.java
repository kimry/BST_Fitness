package com.one.health.service;

import java.util.List;

import com.one.health.dto.ReviewsDto;
import com.one.health.dto.rDto;

public interface ReviewsService {
	boolean insertReviews(ReviewsDto review);
	List<ReviewsDto> getReviewList(String tid);
	List<rDto> getReviewListO(String tid);
	ReviewsDto getReviews(int rnum);
	boolean upRcm(int rnum);
	boolean upOps(int rnum);
}
