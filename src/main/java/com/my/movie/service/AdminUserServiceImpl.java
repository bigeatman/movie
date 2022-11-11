package com.my.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.movie.dao.AdminUserDao;
import com.my.movie.domain.AdminUser;

@Service
public class AdminUserServiceImpl implements AdminUserService {
	@Autowired private AdminUserDao adminUserDao;
	
	@Override
	public AdminUser loginValidate(AdminUser user){
		return adminUserDao.selectAdminUserLogin(user);
	}
	@Override
	public AdminUser getAdmin(AdminUser user) {
		return adminUserDao.selectAdminUser(user);
	}

	@Override
	public List<AdminUser> getUsers() {
		return adminUserDao.selectUsers();
	}
	
	@Override
	public void fixAdminUser(AdminUser user) {
		adminUserDao.updateAdminUser(user);
	}
	
	@Override
	public void addWithDrawal(int userNum) {
		adminUserDao.insertWithDrawal(userNum);
	}
}