package com.my.movie.domain;

import lombok.Data;

@Data
public class GenreDto {
	private Genre genre;
	private int targetNumMovies;
	private int numRegInterest;
}