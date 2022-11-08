package com.my.movie.service;

import com.my.movie.domain.AdminUser;

public interface AdminUserService {
	AdminUser loginValidate(AdminUser adminLogin);
	AdminUser getAdmin(AdminUser admin);
	int getWithDrawal(int adminNum);
	String findId1(AdminUser user);
	String findPw1(AdminUser user);
	String findPw1(String email, String userId);
	void fixPw1(AdminUser user);	
}