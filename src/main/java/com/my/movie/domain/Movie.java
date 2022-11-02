package com.my.movie.domain;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Movie {

	private long movieNum;

	private String movieName;

	private LocalDate movieReleaseDate;

	private int movieRunningTime;

	private String movieCountry;

	private String hashTag;

	private int cumulativeAudience;

	private String movieImgFileName;

	private String movieStory;
}