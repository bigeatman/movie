package com.my.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.CommunityMap;
import com.my.movie.domain.Community;

@Repository
public class CommunityDaoImpl implements CommunityDao {
	@Autowired private CommunityMap communityMap;
	
	@Override
	public List<Community> selectCommunities() {
		return communityMap.selectCommunities();
	}
	
	@Override
	public Community selectCommunity(Community community) {
		return communityMap.selectCommunity(community);
	}
	
	@Override
	public void insertCommunity(Community community) {
		communityMap.insertCommunity(community);
	}
	
	@Override
	public void deleteCommunity(int communityNum) {
		communityMap.deleteCommunity(communityNum);
	}
	
	@Override
	public void inspectionCommunity(int community) {
		communityMap.inspectionCommunity(community);
	}
}
