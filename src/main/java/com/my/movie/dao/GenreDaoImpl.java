package com.my.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.GenreMap;

@Repository
public class GenreDaoImpl implements GenreDao {

	@Autowired
	private GenreMap genreMap;

	@Override
	public List<String> searchGenre(int movieNum) {
		return genreMap.searchMovieGenre(movieNum);
	}

}
