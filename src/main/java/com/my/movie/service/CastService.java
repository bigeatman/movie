package com.my.movie.service;

import java.util.List;

import com.my.movie.domain.Cast;
import com.my.movie.domain.Director;

public interface CastService {

	List<Director> selectAllDirector();
	
	List<Cast> selectAllCast();
	
}
