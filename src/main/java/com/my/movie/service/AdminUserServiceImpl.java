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
	public List<AdminUser> getUsers() {
		return adminUserDao.selectUsers();
	}

	@Override
	public AdminUser loginValidate(AdminUser user){
		return adminUserDao.selectAdminUserLogin(user);
	}
	@Override
	public AdminUser getAdmin(AdminUser user) {
		return adminUserDao.selectAdminUser(user);
	}

	@Override
	public int getWithDrawal(int userNum) {
		return adminUserDao.selectWithDrawal(userNum);
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