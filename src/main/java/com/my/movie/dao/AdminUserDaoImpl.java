package com.my.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.AdminUserMap;
import com.my.movie.domain.AdminUser;

@Repository
public class AdminUserDaoImpl implements AdminUserDao {
	@Autowired private AdminUserMap adminUserMap;

//		@Override
//		public AdminUser selectAdminUserLogin(AdminUser admin) {
//			return adminUserMap.selectAdminUserLogin(admin);
//		}
//		@Override
//		public AdminUser selectAdminUser(AdminUser admin) {
//			return adminUserMap.selectAdminUser(admin);
//		}
//	
//		@Override
//		public int selectWithDrawal(int adminNum) {
//			return adminUserMap.selectWithDrawal(adminNum);
//		}
//	
//		@Override
//		public String selectId1(AdminUser user) {
//			return adminUserMap.selectId1(user);
//		}
//		
//		@Override
//		public String selectPw1(AdminUser user) {
//			return adminUserMap.selectPw1(user);
//		}
//		
//		@Override
//		public String selectPw1(String email, String userId) {
//			return adminUserMap.selectPw1(email, userId);
//		}
//		
//		@Override
//		public void updatePw1(AdminUser user) {
//			adminUserMap.updatePw1(user);
//		}
	@Override
	public List<AdminUser> selectUsers() {
		return adminUserMap.selectUsers();
	}
	
	@Override
	public AdminUser selectAdminUserLogin(AdminUser user) {
		return adminUserMap.selectAdminUserLogin(user);
	}
	@Override
	public AdminUser selectAdminUser(AdminUser user) {
		return adminUserMap.selectAdminUser(user);
	}

	@Override
	public int selectWithDrawal(int userNum) {
		return adminUserMap.selectWithDrawal(userNum);
	}

	@Override
	public String selectId1(AdminUser user) {
		return adminUserMap.selectId1(user);
	}
	
	@Override
	public String selectPw1(AdminUser user) {
		return adminUserMap.selectPw1(user);
	}
	
	@Override
	public String selectPw1(String email, String userId) {
		return adminUserMap.selectPw1(email, userId);
	}
	
	@Override
	public void updatePw1(AdminUser user) {
		adminUserMap.updatePw1(user);
	}
}