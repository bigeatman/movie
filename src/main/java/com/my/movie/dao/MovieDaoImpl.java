package com.my.movie.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.MovieMap;
import com.my.movie.domain.Movie;

@Repository
public class MovieDaoImpl implements MovieDao {

	@Autowired
	private MovieMap movieMap;

	@Override
	public Movie selectById(long id) {
		return movieMap.selectById(id);
	}
}
