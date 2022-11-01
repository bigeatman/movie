package com.my.movie.dao;

import com.my.movie.domain.Movie;

public interface MovieDao {

	public Movie selectById(long id);

}
