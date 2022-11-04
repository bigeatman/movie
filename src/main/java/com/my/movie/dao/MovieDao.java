package com.my.movie.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.movie.domain.Movie;

public interface MovieDao {
	List<Movie> selectMovies();
	List<Movie> searchHashtag(String hashtag);
	List<Movie> selectAdminMovies();
	Movie searchMovie(String movieName);
	void insertMovie(Movie movie);
	void updateMovie(Movie movie);
	void deleteMovie(int movieNum);
	public Movie selectById(long id);
}
