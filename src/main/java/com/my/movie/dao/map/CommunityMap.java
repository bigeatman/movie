package com.my.movie.dao.map;

import java.util.List;

import com.my.movie.domain.Community;

public interface CommunityMap {
	List<Community> selectCommunities();
	List<Community> selectCommunity1(Community community);
	Community selectCommunity2(Community community);
	Community selectCommunity(Community community);
	void insertCommunity(Community community);
	void deleteCommunity(int communityNum);
	void inspectionCommunity(int community);
}
