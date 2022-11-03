package com.my.movie.domain;

import java.time.LocalDate;

import org.springframework.web.multipart.MultipartFile;

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
<<<<<<< HEAD
<<<<<<< HEAD
	private String movieStory;
=======
>>>>>>> 9105c89 (movie 정리)
	
//	private MultipartFile movieImgfile;
=======
	private MultipartFile movieImgfile;
>>>>>>> 48fe4fe (작업 폴더 이동)
}