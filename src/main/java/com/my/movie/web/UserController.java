package com.my.movie.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.dao.GenreDao;
import com.my.movie.domain.User;
import com.my.movie.domain.UserDto;
import com.my.movie.domain.UserGenre;
import com.my.movie.service.UserService;

@RestController
@RequestMapping("user")
public class UserController {
	@Autowired private UserService userService;
	@Autowired private EmailController emailController;
	@Autowired private GenreDao genreDao;


	@GetMapping("login")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("user/login");
		return mv;
	}

	@PostMapping("login")
	public User login(@RequestBody User userLogin, HttpSession session) {
		User user = userService.loginValidate(userLogin);
		if(user != null) {
			User userInfo = userService.getUser(userLogin);
			int userWithDrawal = userService.getWithDrawal(userInfo.getUserNum());
			if(userWithDrawal == 1) {
				user = new User();
				user.setUserNum(-1);
			} else {
				user.setUserNum(userInfo.getUserNum());
				user.setUserId(userInfo.getUserId());
				user.setNickname(userInfo.getNickname());
				user.setPhoneNum(userInfo.getPhoneNum());
				user.setEmail(userInfo.getEmail());
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
	
	@GetMapping("mypage")
	public ModelAndView mypage(ModelAndView mv) {
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
	public ModelAndView join(ModelAndView mv) {
		mv.setViewName("user/join");
		return mv;
	}

	@PostMapping("addUser")
	public void join(@RequestBody UserGenre userGenre) {
		System.out.println(userGenre);
		User user = userGenre.getUser();


//		genreDao.addUserGenre(user, userGenre.getGenreNum());
		// int userNum = num++;
		// Genre genre = userGenre.getGenre();
		// userService.addUser(userGenre.getUser());
		// userService.addUserGenre(userNum, genre.getGenreNum());
	}

	@PostMapping("checkUserId")
	public int idCheck(@RequestBody UserDto userId) {
		int result = userService.checkUserId(userId);
		return result;
	}

	@PostMapping("checkUserNickname")
	public int nicknameCheck(@RequestBody UserDto nickname) {
		int result = userService.checkUserNickname(nickname);
		return result;
	}

	@PostMapping("checkUserPhoneNum")
	public int phoneNumCheck(@RequestBody UserDto phoneNum) {
		int result = userService.checkUserPhoneNum(phoneNum);
		return result;
	}

	@PostMapping("checkUserEmail")
	public int emailCheck(@RequestBody UserDto email) {
		int result = userService.checkUserEmail(email);
		return result;
	}

	// 재원
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
	public ModelAndView findIdResult(ModelAndView mv, @PathVariable String userId) {
		mv.setViewName("user/findIdResult");
		return mv;
	}

	// 비밀번호 찾기
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

	// 비밀번호 수정
	@GetMapping("fixPw/{userId}")
	public ModelAndView changePw(ModelAndView mv,
			@PathVariable String userId) {
		mv.setViewName("user/fixPw");
		return mv;
	}

	@PostMapping("fixPw")
	public void changePw (@RequestBody String pw, 
			@RequestParam("userId") String userId) {
		userService.fixPw1(pw, userId);
		System.out.println(userId);
	}
}