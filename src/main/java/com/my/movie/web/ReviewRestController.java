package com.my.movie.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.my.movie.dao.map.ReviewMap;
import com.my.movie.domain.Review;
import com.my.movie.web.request.CreateReviewRequest;
import com.my.movie.web.request.ViewMoreReviewRequest;

@RestController
@RequestMapping("rev")
public class ReviewRestController {

	@Autowired
	private ReviewMap reviewMap;

	@PostMapping("add")
	public void addReview(@RequestBody CreateReviewRequest request) {
		reviewMap.insertReview(request);
	}

	@PostMapping("morerev")
	public String viewMoreReview(@RequestBody ViewMoreReviewRequest request) {
		int movieId = request.getMovieId();
		int startIndex = request.getStartIndex();
		int rowCount = request.getRowCount();
		
		System.out.println(request);
		
		try {
			List<Review> reviews = reviewMap.selectReviewByMovieId(movieId, startIndex, rowCount);
			System.out.println(reviews);
			ObjectMapper mapper = new ObjectMapper();
			mapper.registerModule(new JavaTimeModule());
			return mapper.writeValueAsString(reviews);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "ERROR";
		}
	}
}
