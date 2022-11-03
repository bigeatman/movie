package com.my.movie.dao;

import com.my.movie.domain.User;
import com.my.movie.domain.UserDto;

public interface UserDao {
	User selectUserLogin(User user);
	int selectUserId(UserDto userId);
	UserDto selectUserPw(UserDto pw);
	int selectUserNickname(UserDto nickname);
	int selectUserPhoneNum(UserDto phoneNum);
	int selectUserEmail(UserDto email);
	void insertUser(User user);
}