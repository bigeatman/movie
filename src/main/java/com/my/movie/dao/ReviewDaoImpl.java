package com.my.movie.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.my.movie.dao.map.ReviewMap;
import com.my.movie.web.request.CreateReviewRequest;

public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private ReviewMap reviewMap;

	@Override
	public void insertReview(CreateReviewRequest req) {
		reviewMap.insertReview(req);
	}
}
