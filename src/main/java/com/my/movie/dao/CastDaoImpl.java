package com.my.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.CastMap;
import com.my.movie.domain.Cast;

@Repository
public class CastDaoImpl implements CastDao {

	@Autowired
	private CastMap castMap;

	@Override
	public List<Cast> findCastByMovieId(int movieId) {
		return castMap.findCastByMovieId(movieId);
	}
}
