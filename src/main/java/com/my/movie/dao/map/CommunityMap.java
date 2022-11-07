package com.my.movie.dao.map;

import java.util.List;

import com.my.movie.domain.Community;

public interface CommunityMap {
	List<Community> selectCommunities();
	Community selectCommunity(Community community);
	void insertCommunity(Community community);
	void deleteCommunity(int communityNum);
	void inspectionCommunity(int community);
}
