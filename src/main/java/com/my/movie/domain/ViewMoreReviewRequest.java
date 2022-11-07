package com.my.movie.domain;

import lombok.Data;

@Data
public class ViewMoreReviewRequest {

	private int movieId;
	
	private int startIndex;
	
	private int rowCount;
}
