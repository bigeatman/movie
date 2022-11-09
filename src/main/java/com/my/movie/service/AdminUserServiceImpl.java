package com.my.movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.movie.dao.AdminUserDao;
import com.my.movie.domain.AdminUser;

@Service
public class AdminUserServiceImpl implements AdminUserService {
	@Autowired private AdminUserDao adminUserDao;

	@Override
	public AdminUser loginValidate(AdminUser admin){
		return adminUserDao.selectAdminUserLogin(admin);
	}
	@Override
	public AdminUser getAdmin(AdminUser admin) {
		return adminUserDao.selectAdminUser(admin);
	}

	@Override
	public int getWithDrawal(int adminNum) {
		return adminUserDao.selectWithDrawal(adminNum);
	}

	@Override
	public String findId1(AdminUser user) {
		return adminUserDao.selectId1(user);
	}
	
	@Override
	public String findPw1(AdminUser user) {
		return adminUserDao.selectPw1(user);
	}
	
	@Override
	public String findPw1(String email, String userId) {
		return adminUserDao.selectPw1(email, userId);
	}
	
	@Override
	public void fixPw1(AdminUser user) {
		adminUserDao.updatePw1(user);
	}
}