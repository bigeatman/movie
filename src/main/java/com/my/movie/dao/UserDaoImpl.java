package com.my.movie.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.UserMap;
import com.my.movie.domain.User;
import com.my.movie.domain.UserDto;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired private UserMap userMap;

	@Override
	public User selectUserLogin(User user) {
		return userMap.selectUserLogin(user);
	}

	@Override
	public int selectUserId(UserDto userId) {
		System.out.println(userMap.selectUserId(userId));
		return userMap.selectUserId(userId);
	}

	@Override
	public UserDto selectUserPw(UserDto pw) {
		return userMap.selectUserPw(pw);
	}

	@Override
	public int selectUserNickname(UserDto nickname) {
		return userMap.selectUserNickname(nickname);
	}

	@Override
	public int selectUserPhoneNum(UserDto phoneNum) {
		return userMap.selectUserPhoneNum(phoneNum);
	}

	@Override
	public int selectUserEmail(UserDto email) {
		return userMap.selectUserEmail(email);
	}
}