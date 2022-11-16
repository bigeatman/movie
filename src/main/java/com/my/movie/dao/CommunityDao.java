package com.my.movie.dao;

import java.util.List;

import com.my.movie.domain.Community;

public interface CommunityDao {
	List<Community> selectCommunities();
	Community selectCommunity(Community community);
	Community selectCommunity1(Community community);
	void insertCommunity(Community community);
	void deleteCommunity(int communityNum);
	void inspectionCommunity(int community);
}
