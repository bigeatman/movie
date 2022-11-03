package com.my.movie.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.domain.User;
import com.my.movie.service.UserService;

@RestController
@RequestMapping("user")
public class UserController {
	@Autowired private UserService userService;
	
	@GetMapping("login")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("user/login");
		return mv;
	}
	
//	@GetMapping("searchMovie")
//	public ModelAndView movie(ModelAndView mv) {
//		mv.setViewName("movie/searchMovie");
//		return mv;
//	}
	
	@GetMapping("mypage")
	public ModelAndView mypage(ModelAndView mv) {
		mv.setViewName("user/mypage");
		return mv;
	}
	
	@PostMapping("login")
	public User login(@RequestBody User userLogin, HttpSession session) {
		User user = userService.loginValidate(userLogin);
		session.setAttribute("user", user);
		return user;
	}
}