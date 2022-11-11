package com.my.movie.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.domain.Community;
import com.my.movie.service.CommunityService;

@RestController
@RequestMapping("community")
public class CommunityController {
	@Autowired private CommunityService communityService;
	
	@RequestMapping("list")
	public ModelAndView communities(ModelAndView mv) {
		mv.setViewName("community/list");
		return mv;
	}
	
	@PostMapping
	public List<Community> communityList() {
		return communityService.getCommunities();
	}
	
	@GetMapping("content")
	public ModelAndView content(ModelAndView mv) {
		mv.setViewName("community/content");
		return mv;
	}

	@GetMapping("write")
	public ModelAndView write(ModelAndView mv, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		if(userId == null) {
			mv.setViewName("community/write");
		} else {			
			mv.addObject("userId", userId);
			mv.setViewName("redirect:../user/login");
		}
		
		return mv;
	}
	
	@PostMapping("add")
	public void addCommunity(@RequestBody Community community) {
		communityService.addCommunity(community);
	}
	
	@DeleteMapping("del/{communityNum}")
	public void delCommunity(@PathVariable int communityNum) {
		communityService.delCommunity(communityNum);
	}
}
