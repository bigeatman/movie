package com.my.movie.dao.map;

import org.apache.ibatis.annotations.Param;

import com.my.movie.domain.AdminUser;

public interface AdminUserMap {
	AdminUser selectAdminUserLogin(AdminUser admin);
	AdminUser selectAdminUser(AdminUser admin);
	int selectWithDrawal(int adminNum);
	String selectId1(AdminUser user);
	String selectPw1(AdminUser user);
	String selectPw1(@Param("email")String email,
					@Param("userId")String userId);
	void updatePw1(AdminUser user);
}