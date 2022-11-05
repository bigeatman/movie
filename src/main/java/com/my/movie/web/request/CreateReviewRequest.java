package com.my.movie.web.request;

import lombok.Data;

@Data
public class CreateReviewRequest {
	
	private String reviewContent;
	
	private float grade;
	
	private int movieNum;
	
	private int userNum;
	
}
