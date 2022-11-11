package com.my.movie.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.movie.domain.AdminUser;

public interface AdminUserMap {
	AdminUser selectAdminUserLogin(AdminUser user);
	AdminUser selectAdminUser(AdminUser user);
	List<AdminUser> selectUsers();
	void updateAdminUser(AdminUser user);
	void insertWithDrawal(int userNum);
}