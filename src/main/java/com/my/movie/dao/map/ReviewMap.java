package com.my.movie.dao.map;

import com.my.movie.web.request.CreateReviewRequest;

public interface ReviewMap {
	
	void insertReview(CreateReviewRequest req);
	
}
