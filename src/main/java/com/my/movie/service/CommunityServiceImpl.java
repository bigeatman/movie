package com.my.movie.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.dao.CommunityDao;
import com.my.movie.domain.Community;
import com.my.movie.domain.User;

@Service
public class CommunityServiceImpl implements CommunityService {
	@Autowired private CommunityDao communityDao;
	
	@Override
	public List<Community> getCommunities() {
		return communityDao.selectCommunities();
	}
	
	@Override
	public ModelAndView getCommunity(Community community, ModelAndView mv, HttpSession session) {
		User user = (User) session.getAttribute("user");
		Community communityVal = communityDao.selectCommunity(community);
		
		mv.addObject("user", user);
		mv.addObject("Community", communityVal);
		
		return mv;
	}
	
	@Override
	public void addCommunity(Community community) {
		communityDao.insertCommunity(community);
	}
	
	@Override
	public void delCommunity(int communityNum) {
		communityDao.deleteCommunity(communityNum);
	}
	
	@Override
	public void inspectionCommunity(int communityNum) {
		communityDao.inspectionCommunity(communityNum);
	}
}
