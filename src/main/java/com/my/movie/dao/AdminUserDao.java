package com.my.movie.dao;

import com.my.movie.domain.AdminUser;


public interface AdminUserDao {
	AdminUser selectAdminUserLogin(AdminUser admin);
	AdminUser selectAdminUser(AdminUser admin);
	int selectWithDrawal(int adminNum);
	
	String selectId1(AdminUser user);
	String selectPw1(AdminUser user);
	String selectPw1(String email, String userId);
	void updatePw1(AdminUser user);
}