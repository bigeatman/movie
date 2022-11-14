package com.my.movie.dao.map;

import java.util.List;

import com.my.movie.domain.AdminCountList;
import com.my.movie.domain.AdminUser;

public interface AdminUserMap {
	AdminUser selectAdminUserLogin(AdminUser user);
	AdminUser selectAdminUser(AdminUser user);
	AdminCountList selectCountList();
	List<AdminUser> selectUsers();
	void updateAdminUser(AdminUser user);
	void insertWithDrawal(int userNum);
}