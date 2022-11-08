package com.my.movie.dao;

import java.util.List;

import com.my.movie.domain.Inspection;

public interface InspectionDao {
	List<Inspection> selectAll();
	List<Inspection> selectDetail(Inspection inspection);
	void updateStatus(Inspection inspection);
}