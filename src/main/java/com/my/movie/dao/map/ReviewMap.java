package com.my.movie.dao.map;

import java.util.List;

import com.my.movie.domain.Review;
import com.my.movie.web.request.CreateReviewRequest;

public interface ReviewMap {
	
	void insertReview(CreateReviewRequest req);
	
	List<Review> selectReviewByMovieId(int movieId, int startIndex, int rowCount);
}
