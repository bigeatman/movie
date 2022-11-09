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
			int userWithDrawal = adminUserService.getWithDrawal(admin.getAdminNum());
			if(userWithDrawal == 1) {
				admin = new AdminUser();
				admin.setAdminNum(-1);
			} else {
				session.setAttribute("admin", admin);
			}
		}
		return admin;
	}
	@GetMapping("logout")
	public ModelAndView logout(ModelAndView mv, HttpSession session) {
		session.invalidate();
		mv.setViewName("redirect:/admin");
		return mv;
	}
/*	
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
	
	

	@GetMapping("findId")
	public ModelAndView findId(ModelAndView mv) {
		mv.setViewName("user/findId");
		return mv;
	}

	@PostMapping("findId")
	public String findId(@RequestBody User find) {
		return userService.findId1(find);
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