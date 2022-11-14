package com.my.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.movie.dao.GenreDao;
import com.my.movie.domain.Genre;
import com.my.movie.domain.GenreDto;

@Service
public class GenreServiceImpl implements GenreService {
	@Autowired private GenreDao genreDao;
	
	@Override
	public List<Genre> getAll() {
		return genreDao.selectAll();
	}

	@Override
	public void addGenre(String genreName) {
		genreDao.insertGenre(genreName);
	}

	@Override
	public List<GenreDto> getGenre() {
		return genreDao.selectGenre();
	}

	@Override
	public List<String> getCheckGenre() {
		return genreDao.selectCheckGenre();
	}
}