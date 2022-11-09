package com.my.movie.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.movie.domain.AdminUser;

public interface AdminUserMap {
	List<AdminUser> selectUsers();
	AdminUser selectAdminUserLogin(AdminUser user);
	AdminUser selectAdminUser(AdminUser user);
	int selectWithDrawal(int userNum);
	String selectId1(AdminUser user);
	String selectPw1(AdminUser user);
	String selectPw1(@Param("email")String email,
					@Param("userId")String userId);
	void updatePw1(AdminUser user);
}