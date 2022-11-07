package com.my.movie.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.my.movie.domain.Community;

public interface CommunityService {
	List<Community> getCommunities();
	ModelAndView getCommunity(Community community, ModelAndView mv, HttpSession session);
	void addCommunity(Community community);
	void delCommunity(int communityNum);
	void inspectionCommunity(int communityNum);
}
