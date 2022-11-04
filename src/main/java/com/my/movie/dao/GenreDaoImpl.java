package com.my.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.GenreMap;
import com.my.movie.domain.Movie;
import com.my.movie.domain.User;

@Repository
public class GenreDaoImpl implements GenreDao {

	@Autowired
	private GenreMap genreMap;

	@Override
	public List<String> searchGenre(int movieNum) {
		return genreMap.getMovieGenre(movieNum);
	}

	public List<Movie> searchMovieByGenre(String genreName) {
		return genreMap.searchMovieByGenre(genreName);
	}

	@Override
	public void addUserGenre(User user, List<String> genres) {
		for (String genre : genres) {
			int genreNum = genreMap.getGenreId(genre);
			genreMap.insertUserGenre(user.getUserNum(), genreNum);
		}
	}

	@Override
	public void addMovieGenre(Movie movie, List<String> genres) {
		for (String genre : genres) {
			int genreNum = genreMap.getGenreId(genre);
			genreMap.insertMovieGenre(movie.getMovieNum(), genreNum);
		}
	}
}
