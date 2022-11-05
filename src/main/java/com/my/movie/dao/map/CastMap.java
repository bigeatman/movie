package com.my.movie.dao.map;

import java.util.List;

import com.my.movie.domain.Cast;

public interface CastMap {

	List<Cast> findCastByMovieId(int movieId);
	
}
