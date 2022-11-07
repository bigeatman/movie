package com.my.movie.web.request;

import lombok.Data;

@Data
public class ViewMoreReviewRequest {

	private int movieId;
	
	private int startIndex;
	
	private int rowCount;
}
