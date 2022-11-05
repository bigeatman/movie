package com.my.movie.dao;

import com.my.movie.web.request.CreateReviewRequest;

public interface ReviewDao {
	void insertReview(CreateReviewRequest req);
}
