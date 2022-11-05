package com.my.movie.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.my.movie.dao.map.ReviewMap;
import com.my.movie.web.request.CreateReviewRequest;

@RestController
@RequestMapping("rev")
public class ReviewRestController {

	@Autowired
	private ReviewMap reviewMap;
	
	@PostMapping
	public void addReview(@RequestBody CreateReviewRequest request) {
		reviewMap.insertReview(request);
	}
}
