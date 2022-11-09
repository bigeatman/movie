package com.my.movie.dao;

import java.util.List;

import com.my.movie.domain.Cast;
import com.my.movie.domain.Director;

public interface CastDao {

	List<Cast> selectByMoveId(int movieId);

	List<Director> selectAllDirector();

	List<Cast> selectAllCast();
	
}
