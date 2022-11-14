package com.my.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.AdminUserMap;
import com.my.movie.domain.AdminCountList;
import com.my.movie.domain.AdminUser;

@Repository
public class AdminUserDaoImpl implements AdminUserDao {
	@Autowired private AdminUserMap adminUserMap;

	@Override
	public AdminUser selectAdminUserLogin(AdminUser user) {
		return adminUserMap.selectAdminUserLogin(user);
	}
	
	@Override
	public AdminUser selectAdminUser(AdminUser user) {
		return adminUserMap.selectAdminUser(user);
	}
	
	@Override
	public AdminCountList selectCountList() {
		return adminUserMap.selectCountList();
	}

	@Override
	public List<AdminUser> selectUsers() {
		return adminUserMap.selectUsers();
	}

	@Override
	public void updateAdminUser(AdminUser user) {
		adminUserMap.updateAdminUser(user);
	}
	
	@Override
	public void insertWithDrawal(int userNum) {
		adminUserMap.insertWithDrawal(userNum);
	}
}