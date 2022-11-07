package com.my.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.ReviewMap;
import com.my.movie.domain.Review;
import com.my.movie.web.request.CreateReviewRequest;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private ReviewMap reviewMap;

	@Override
	public void insertReview(CreateReviewRequest req) {
		reviewMap.insertReview(req);
	}

	@Override
	public List<Review> selectReviewByMovieId(int movieId, int startIndex, int rowCount) {
		return reviewMap.selectReviewByMovieId(movieId, startIndex, rowCount);
	}
}
