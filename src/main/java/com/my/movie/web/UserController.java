package com.my.movie.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.domain.User;
import com.my.movie.service.UserService;

@RestController
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserService userService;

	@GetMapping("login")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("user/login");
		return mv;
	}

	@GetMapping("mypage")
	public ModelAndView mypage(HttpSession session, ModelAndView mv) {
		mv.setViewName("user/mypage");
		return mv;
	}

	@PostMapping("login")
	public ModelAndView login(ModelAndView mv, User user, HttpSession session) {
		System.out.println(user.getUserId() + " " + user.getPw());

		User userLogin = userService.selectUser(user, session);
		mv.setViewName("redirect:/");
		return mv;
	}

	@GetMapping("logout")
	public ModelAndView logout(ModelAndView mv, HttpSession session) {
		userService.logout(session);
		mv.setViewName("redirect:/");
		return mv;
	}
}