package com.my.movie.domain;

import lombok.Data;

@Data
public class ReviewDto {

	private Movie movie;

	private String summaryString;

	private String audienceString;

}
  