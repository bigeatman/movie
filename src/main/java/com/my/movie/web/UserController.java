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
import com.my.movie.domain.UserDto;
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
		System.out.println(userLogin);
		User user = userService.loginValidate(userLogin);
		session.setAttribute("user", user);
		return user;
	}
	
	@GetMapping("join")
	public ModelAndView join(ModelAndView mv) {
		mv.setViewName("user/join");
		return mv;
	}
	
	@PostMapping("join/checkId")
	public int idCheck(@RequestBody UserDto userId) {
		System.out.println(userId);
		int result = userService.checkUserId(userId);
		System.out.println(result);
		return result;
	}
	
	@PostMapping("join/checkNickname")
	public int nicknameCheck(@RequestBody UserDto nickname) {
		System.out.println(nickname);
		int result = userService.checkUserNickname(nickname);
		System.out.println(result);
		return result;
	}
	
	@PostMapping("join/checkPhoneNum")
	public int phoneNumCheck(@RequestBody UserDto phoneNum) {
		System.out.println(phoneNum);
		int result = userService.checkUserPhoneNum(phoneNum);
		System.out.println(result);
		return result;
	}
	
	@PostMapping("join/checkEmail")
	public int emailCheck(@RequestBody UserDto email) {
		System.out.println(email);
		int result = userService.checkUserEmail(email);
		System.out.println(result);
		return result;
	}
}