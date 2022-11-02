package com.my.movie.dao.map;

import java.util.List;

import com.my.movie.domain.Genre;

public interface GenreMap {

	List<String> searchMovieGenre(int movieNum);

	List<Genre> selectAll();
	
}
