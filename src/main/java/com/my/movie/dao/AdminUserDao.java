package com.my.movie.dao;

import java.util.List;

import com.my.movie.domain.AdminUser;


public interface AdminUserDao {
//	AdminUser selectAdminUserLogin(AdminUser admin);
//	AdminUser selectAdminUser(AdminUser admin);
//	int selectWithDrawal(int adminNum);
//	
//	String selectId1(AdminUser user);
//	String selectPw1(AdminUser user);
//	String selectPw1(String email, String userId);
//	void updatePw1(AdminUser user);
	
	List<AdminUser> selectUsers();
	AdminUser selectAdminUserLogin(AdminUser user);
	AdminUser selectAdminUser(AdminUser user);
	int selectWithDrawal(int userNum);
	
	String selectId1(AdminUser user);
	String selectPw1(AdminUser user);
	String selectPw1(String email, String userId);
	void updatePw1(AdminUser user);
}