package com.my.movie.dao;

import java.util.List;

import com.my.movie.domain.AdminUser;


public interface AdminUserDao {
	AdminUser selectAdminUserLogin(AdminUser user);
	AdminUser selectAdminUser(AdminUser user);
	List<AdminUser> selectUsers();
	void updateAdminUser(AdminUser user);
	void insertWithDrawal(int userNum);
}