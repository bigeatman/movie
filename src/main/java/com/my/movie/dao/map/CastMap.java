package com.my.movie.dao.map;

import java.util.List;

import com.my.movie.domain.Cast;
import com.my.movie.domain.Director;

public interface CastMap {

	List<Cast> selectByMovieId(int movieId);

	List<Director> selectAllDirector();

	List<Cast> selectAllCast();
	
}
