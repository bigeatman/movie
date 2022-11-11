package com.my.movie.web;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.my.movie.domain.Community;
import com.my.movie.service.CommunityService;

@RestController
@RequestMapping("community")
public class CommunityController {
	@Autowired
	private CommunityService communityService;
	
	@GetMapping("list")
	public ModelAndView communities(ModelAndView mv) {
		mv.setViewName("community/list");
		return mv;
	}
	
	@PostMapping("list")
	public String communities() {
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			return mapper.writeValueAsString(communityService.getCommunities());
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return "ERROR";
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
	public ModelAndView write(ModelAndView mv) {
		mv.setViewName("community/write");
		return mv;
	}
	
	@ResponseBody
	@PostMapping("write")
	public ModelAndView addWrite(Community community, ModelAndView mv) throws IOException {
	    try {
	    communityService.addCommunity(community);
	    }catch(NullPointerException e) {}
	      
	    mv.setViewName("community/write");
	    return mv;
	}
	   

/*	   
	@PostMapping("write")
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
	
	@GetMapping("write")
	public void addCommunity(@RequestBody Community community) {
		communityService.addCommunity(community);
	}
*/
	
	@DeleteMapping("del/{communityNum}")
	public void delCommunity(@PathVariable int communityNum) {
		communityService.delCommunity(communityNum);
	}	
	
	/*
	 * @RequestMapping(value = "/content", method = RequestMethod.GET) public String
	 * getcontent() throws Exception { return "community/content"; }
	 */
}
