package com.my.movie.service;

import java.util.List;

import com.my.movie.domain.AdminUser;

public interface AdminUserService {
//	AdminUser loginValidate(AdminUser adminLogin);
//	AdminUser getAdmin(AdminUser admin);
//	int getWithDrawal(int adminNum);
//	String findId1(AdminUser user);
//	String findPw1(AdminUser user);
//	String findPw1(String email, String userId);
//	void fixPw1(AdminUser user);
	
	List<AdminUser> getUsers(); 
	AdminUser loginValidate(AdminUser userLogin);
	AdminUser getAdmin(AdminUser user);
	int getWithDrawal(int userNum);
	String findId1(AdminUser user);
	String findPw1(AdminUser user);
	String findPw1(String email, String userId);
	void fixPw1(AdminUser user);	
	
}