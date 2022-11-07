package com.my.movie.dao;

import java.util.List;

import com.my.movie.domain.Cast;

public interface CastDao {

	List<Cast> findCastByMovieId(int movieId);
	
}
