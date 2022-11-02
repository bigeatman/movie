package com.my.movie.dao.map;

import com.my.movie.domain.Movie;

public interface MovieMap {

	Movie selectById(long id);
	
}
