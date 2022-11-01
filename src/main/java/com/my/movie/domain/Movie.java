package com.my.movie.domain;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Movie {

	private long movieNum;

	private String movieName;

	private LocalDateTime movieReleaseDate;

	private int movieRunningTime;

	private String movieSummary;

	private String hashTag;

	private int cumulativeAudience;

	private String movieImgFileName;

}