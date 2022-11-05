package com.my.movie.service;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.DirectorDao;
import com.my.movie.dao.GenreDao;
import com.my.movie.dao.MovieDao;
import com.my.movie.domain.Director;
import com.my.movie.domain.Movie;
import com.my.movie.domain.ReviewDto;

@Repository
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private MovieDao movieDao;

	@Autowired
	private GenreDao genreDao;

	@Autowired
	private DirectorDao directorDao;

	private static final DecimalFormat formatter = new DecimalFormat("###,###");

	@Override
	public ReviewDto getReviewDtoByMovieId(int movieId) {
		Movie movie = movieDao.selectById(movieId);

		ReviewDto dto = new ReviewDto();
		dto.setMovie(movie);
		dto.setSummaryString(toSummaryString(movie));
		dto.setAudienceString(formatter.format(movie.getCumulativeAudience()));
		dto.setDirector(directorDao.findDirectorByMovieId(movieId));

		return dto;
	}

	private String toSummaryString(Movie movie) {
		List<String> genres = genreDao.searchGenre(movie.getMovieNum());
		StringBuilder builder = new StringBuilder();

		builder.append(movie.getMovieCountry());
		builder.append(" | ");

		for (String genre : genres) {
			builder.append(genre);
			builder.append(", ");
		}

		builder.setLength(builder.length() - 2);
		return builder.toString();
	}
}
