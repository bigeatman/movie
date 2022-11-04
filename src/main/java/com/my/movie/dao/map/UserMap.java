package com.my.movie.dao.map;

import com.my.movie.domain.User;
import com.my.movie.domain.UserDto;
import com.my.movie.domain.UserGenre;

public interface UserMap {
	User selectUserLogin(User user);
	int selectUserId(UserDto userId);
	UserDto selectUserPw(UserDto pw);
	int selectUserNickname(UserDto nickname);
	int selectUserPhoneNum(UserDto phoneNum);
	int selectUserEmail(UserDto email);
	void insertUser(User user);
	void insertUserGenre(UserGenre userGenre);
}