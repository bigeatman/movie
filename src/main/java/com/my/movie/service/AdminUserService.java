package com.my.movie.service;

import java.util.List;

import com.my.movie.domain.AdminUser;
import com.my.movie.domain.AdminUserDto;

public interface AdminUserService {
	AdminUser loginValidate(AdminUser userLogin);
	AdminUser getAdmin(AdminUser user);
	List<AdminUser> getUsers(); 
	List<AdminUser> getSearchUsers(AdminUserDto adminUserDto);
	void fixAdminUser(AdminUser user);
	void addWithDrawal(int userNum);
}