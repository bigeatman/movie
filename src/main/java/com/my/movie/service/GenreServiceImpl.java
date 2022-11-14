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
	public List<GenreDto> getGenre() {
		return genreDao.selectGenre();
	}

	@Override
	public int getCheckGenre(String genreName) {
		return genreDao.selectCheckGenre(genreName);
	}
}