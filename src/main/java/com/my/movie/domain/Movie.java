package com.my.movie.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Movie {
	private int movieNum;
	private String movieName;
	private LocalDate movieReleasedate;
	private String hashtag;
	private String movieImgfileName;
	private int movieRunningtime;
	private String movieCountry;
	private int cumulativeAudience;
	private String movieStory;
	
//	private MultipartFile movieImgfile;
}