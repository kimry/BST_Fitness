package com.one.health.service;

import java.util.List;

import com.one.health.dto.ReviewsDto;

public interface ReviewsService {
	boolean insertReviews(ReviewsDto review);
	List<ReviewsDto> getReviewList();
}
