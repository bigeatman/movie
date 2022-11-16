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
	
	@PostMapping("list")
	public List<Community> communityList() {
		return communityService.getCommunities();
	}
	
	@GetMapping("content/{communityNum}")
	public ModelAndView findIdResult(ModelAndView mv,
			@PathVariable int communityNum) {
		mv.addObject("communityNum", communityNum);
		mv.setViewName("community/content");
		return mv;
	}
	
	@PostMapping("content/{communityNum}")
	public void getCommunity(@RequestBody Community community) {
		communityService.getCommunity1(community);
		System.out.print(community);
	}

	@GetMapping("write")
	public ModelAndView write(ModelAndView mv, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		if(userId != null) {
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
		System.out.println('1');
	}
	
	@DeleteMapping("del/{communityNum}")
	public void delCommunity(@PathVariable int communityNum) {
		communityService.delCommunity(communityNum);
	}
}
