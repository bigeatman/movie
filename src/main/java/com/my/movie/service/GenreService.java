package com.my.movie.service;

import java.util.List;

import com.my.movie.domain.Genre;
import com.my.movie.domain.GenreDto;

public interface GenreService {
	List<Genre> getAll();
	void addGenre(String genreName);
	List<GenreDto> getGenre();
	List<String> getCheckGenre();
}