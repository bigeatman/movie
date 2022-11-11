package com.my.movie.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.domain.User;
import com.my.movie.domain.UserDto;
import com.my.movie.domain.UserGenre;
import com.my.movie.service.UserService;

@RestController
@RequestMapping("user")
public class UserController {
	@Autowired private UserService userService;
	@Autowired private EmailController emailController;
	
	@GetMapping("login")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("user/login");
		return mv;
	}

	@PostMapping("login")
	public User login(@RequestBody User userLogin, HttpSession session) {
		User user = userService.loginValidate(userLogin);
		if(user != null) {
			int userWithDrawal = userService.getWithDrawal(user.getUserNum());
			if(userWithDrawal == 1) {
				user = new User();
				user.setUserNum(-1);
			} else {
				session.setAttribute("user", user);
			}
		}
		return user;
	}
	
	@GetMapping("logout")
	public ModelAndView logout(ModelAndView mv, HttpSession session) {
		session.invalidate();
		mv.setViewName("redirect:/");
		return mv;
	}
	
//	@GetMapping("searchMovie")
//	public ModelAndView movie(ModelAndView mv) {
//		mv.setViewName("movie/searchMovie");
//		return mv;
//	}
	@PostMapping("getGenreNames")
	public List<String> getGenreNames(@RequestBody int userNum) {
		return userService.getUserGenre(userNum);
	}	@GetMapping("mypage")
	public ModelAndView mypage(ModelAndView mv, HttpSession session) {
		mv.setViewName("user/mypage");
		return mv;
	}

	@GetMapping("addWithDrawal")
	public ModelAndView addWithDrawal(ModelAndView mv) {
		mv.setViewName("user/withDrawal");
		return mv;
	}

	@PostMapping("addWithDrawal")
	public void addWithDrawal(@RequestBody User userNum, HttpSession session) {
		userService.addWithDrawal(userNum.getUserNum());
		session.invalidate();
	}
	
	@GetMapping("addUser")
	public ModelAndView addUser(ModelAndView mv) {
		mv.setViewName("user/join");
		return mv;
	}

	@PostMapping("addUser")
	public void addUser(@RequestBody UserGenre userGenre) {
		User user = userGenre.getUser();
		userService.addUser(user);
		List<Integer> genres = userGenre.getGenreNum();
		for(int genre: genres) {
			userService.addUserGenre(genre);
		}
	}

	@PostMapping("checkUserId")
	public int checkUserId(@RequestBody UserDto userId) {
		int result = userService.checkUserId(userId.getUserId());
		return result;
	}

	@PostMapping("checkUserNickname")
	public int checkUserNickname(@RequestBody UserDto nickname) {
		int result = userService.checkUserNickname(nickname.getNickname());
		return result;
	}

	@PostMapping("checkUserPhoneNum")
	public int checkUserPhoneNum(@RequestBody UserDto phoneNum) {
		int result = userService.checkUserPhoneNum(phoneNum.getPhoneNum());
		return result;
	}

	@PostMapping("checkUserEmail")
	public int checkUserEmail(@RequestBody UserDto email) {
		int result = userService.checkUserEmail(email.getEmail());
		return result;
	}

	@GetMapping("findId")
	public ModelAndView findId(ModelAndView mv) {
		mv.setViewName("user/findId");
		return mv;
	}

	@PostMapping("findId")
	public String findId(@RequestBody User find) {
		return userService.findId1(find);
	}

	@GetMapping("findIdResult/{userId}")
	public ModelAndView findIdResult(ModelAndView mv,
			@PathVariable String userId) {
		mv.setViewName("user/findIdResult");
		return mv;
	}

	@GetMapping("findPw")
	public ModelAndView findPw(ModelAndView mv) {
		mv.setViewName("user/findPw");
		return mv;
	}

	@PostMapping("findPw")
	public String findPw(@RequestBody User find) {
		return userService.findPw1(find);
	}

	@PostMapping("findPwCode")
	public ModelAndView mypage(ModelAndView mv,
			@RequestParam("inputId") String userId,
			@RequestParam("inputEmail") String inputEmail, 
			@RequestParam("domainTxt") String domainTxt
			,String userNum) throws Exception {
		String email = inputEmail + "@" + domainTxt;
		userService.findPw1(email, userId);
		mv.addObject("email", email);
		mv.addObject("userId", userId);
		mv.setViewName("user/findPwCode");
		
		emailController.mailConfirm(email);
		mv.addObject("code", emailController.mailConfirm(email));
		
		return mv;
	}

	@GetMapping("fixPw/{userId}")
	public ModelAndView changePw(ModelAndView mv,
			@PathVariable String userId) {
		mv.setViewName("user/fixPw");
		return mv;
	}
	
	@PostMapping("fixPw")
	public ModelAndView fixPw (ModelAndView mv
			,HttpServletRequest request) {

		mv.setViewName("user/fixPw");
		mv.addObject("email", request.getParameter("email"));
		mv.addObject("userId", request.getParameter("userId"));
		return mv;
	}
	
	@PatchMapping("fixPw")
	public void fixPw(@RequestBody User fix) {
		userService.fixPw1(fix);
	}
}