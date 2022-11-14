package com.my.movie.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.domain.AdminCountList;
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
		AdminUser user = adminUserService.loginValidate(adminLogin);
		if(user != null) {
			session.setAttribute("userId", user.getUserId());
		}
		return user;
	}
	
	@GetMapping("logout")
	public ModelAndView logout(ModelAndView mv, HttpSession session) {
		session.invalidate();
		mv.setViewName("redirect:/admin");
		return mv;
	}
	
	@GetMapping("getCountList")
	public AdminCountList getCountList() {
		System.out.println(adminUserService.getCountList());
		return adminUserService.getCountList();
	}
	
	@GetMapping("users")
	public ModelAndView users(ModelAndView mv) {
		mv.setViewName("admin/user/users");
		return mv;
	}

	@GetMapping("users/list")
	public List<AdminUser> getUsers(){
		return adminUserService.getUsers();
	}
	
	@PatchMapping("users/fix")
	public void fixUser(@RequestBody AdminUser user) {
		adminUserService.fixAdminUser(user);
	}
	
	@PostMapping("users/addWithDrawal")
	public void addWithDrawal(@RequestBody AdminUser userNum) {
		adminUserService.addWithDrawal(userNum.getUserNum());
	}
}