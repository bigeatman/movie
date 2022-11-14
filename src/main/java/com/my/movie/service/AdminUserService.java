package com.my.movie.service;

import java.util.List;

import com.my.movie.domain.AdminCountList;
import com.my.movie.domain.AdminUser;

public interface AdminUserService {
	AdminUser loginValidate(AdminUser userLogin);
	AdminUser getAdmin(AdminUser user);
	AdminCountList getCountList();
	List<AdminUser> getUsers(); 
	void fixAdminUser(AdminUser user);
	void addWithDrawal(int userNum);
}