package com.my.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.InspectionMap;
import com.my.movie.domain.Inspection;

@Repository
public class InspectionDaoImpl implements InspectionDao {

	@Autowired private InspectionMap inspectionMap;
	
	@Override
	public List<Inspection> selectAll() {
		return inspectionMap.selectAll();
	}
	
	@Override
	public List<Inspection> selectDetail(Inspection inspection) {
		return inspectionMap.selectDetail(inspection);
	}
}
