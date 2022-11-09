package com.my.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.CastDao;
import com.my.movie.domain.Cast;
import com.my.movie.domain.Director;

@Repository
public class CastServiceImpl implements CastService {

	@Autowired
	private CastDao castDao;

	@Override
	public List<Director> selectAllDirector() {
		return castDao.selectAllDirector();
	}

	@Override
	public List<Cast> selectAllCast() {
		return castDao.selectAllCast();
	}
}
