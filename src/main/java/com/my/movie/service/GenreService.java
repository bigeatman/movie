package com.my.movie.service;

import com.my.movie.domain.Genre;
import com.my.movie.domain.GenreDto;

public interface GenreService {
	void addGenre(String genreName);
	GenreDto getGenre(Genre genre, int movieNum, int userNum);
	int getMovie(int genreNum);
	int getUser(int genreNum);
}