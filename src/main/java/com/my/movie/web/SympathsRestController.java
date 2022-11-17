package com.my.movie.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.my.movie.domain.request.LikeContentRequest;
import com.my.movie.service.SympathService;

@RestController
@RequestMapping("sym")
public class SympathsRestController {
	
	@Autowired
	private SympathService sympathService;
	
	@PostMapping("revlike")
	public String likeReview(@RequestBody LikeContentRequest req) {
		Integer liked = sympathService.isContentLiked(req.getContentNum(), req.getContentName(), req.getUserNum());
		
		if((liked == null) || (liked == 0)) {
			sympathService.addContentLiked(req.getContentNum(), req.getContentName(), req.getUserNum(), 1);
			return "SUCCESS";
		} else {
			return "Already liked";
		}
	}
}
