package com.my.movie.service;

import java.util.List;

import com.my.movie.domain.Inspection;
import com.my.movie.domain.User;
import com.my.movie.domain.UserDto;

public interface InspectionService {
	List<Inspection> selectAll();
	List<Inspection> selectDetail(Inspection inspection);
}