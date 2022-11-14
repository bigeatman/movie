package com.my.movie.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.movie.domain.AdminUser;
import com.my.movie.domain.AdminUserDto;

public interface AdminUserMap {
	AdminUser selectAdminUserLogin(AdminUser adminUser);
	AdminUser selectAdminUser(AdminUser adminUser);
	List<AdminUser> selectUsers();
	List<AdminUser> selectSearchUsers(AdminUserDto adminUserDto);
	void updateAdminUser(AdminUserDto adminUserDto);
	void insertWithDrawal(int adminUserDto);
}