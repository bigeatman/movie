package com.my.movie.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.domain.AdminUser;
import com.my.movie.service.AdminUserService;

@RestController
@RequestMapping("admin/user")
public class AdminUserController {
	@Autowired private AdminUserService adminUserService;


	@GetMapping("login")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("admin/user/login");
		return mv;
	}

	@PostMapping("login")
	public AdminUser login(@RequestBody AdminUser adminLogin, HttpSession session) {
		AdminUser admin = adminUserService.loginValidate(adminLogin);
		if(admin != null) {
			AdminUser adminInfo = adminUserService.getAdmin(adminLogin);
			int userWithDrawal = adminUserService.getWithDrawal(adminInfo.getAdminNum());
			if(userWithDrawal == 1) {
				admin = new AdminUser();
				admin.setAdminNum(-1);
			} else {
				admin.setAdminNum(adminInfo.getAdminNum());
				admin.setAdminId(adminInfo.getAdminId());
				admin.setNickname(adminInfo.getNickname());
				admin.setPhoneNum(adminInfo.getPhoneNum());
				admin.setEmail(adminInfo.getEmail());
				session.setAttribute("admin", admin);
			}
		}
		return admin;
	}
	@GetMapping("logout")
	public ModelAndView logout(ModelAndView mv, HttpSession session) {
		session.invalidate();
		mv.setViewName("redirect:/admin/");
		return mv;
	}
/*	
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

	// ���
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

	// ��й�ȣ ã��
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
	*/
}