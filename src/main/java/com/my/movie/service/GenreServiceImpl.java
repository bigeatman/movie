package com.my.movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.movie.dao.GenreDao;
import com.my.movie.domain.Genre;
import com.my.movie.domain.GenreDto;

@Service
public class GenreServiceImpl implements GenreService {
	@Autowired private GenreDao genreDao;
	
	@Override
	public void addGenre(String genreName) {
		genreDao.insertGenre(genreName);
	}

	@Override
	public GenreDto getGenre(Genre genre, int movieNum, int userNum) {
		return genreDao.selectGenre(genre, movieNum, userNum);
	}

	@Override
	public int getMovie(int genreNum) {
		return genreDao.selectMovie(genreNum);
	}

	@Override
	public int getUser(int genreNum) {
		return genreDao.selectUser(genreNum);
	}
}