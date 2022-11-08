package com.my.movie.dao.map;

import java.util.List;

import com.my.movie.domain.Inspection;

public interface InspectionMap {
	List<Inspection> selectAll();
	List<Inspection> selectDetail(Inspection inspection);
	void updateStatus(Inspection inspection);
}
