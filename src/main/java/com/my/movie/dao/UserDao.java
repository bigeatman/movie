package com.my.movie.dao;

import com.my.movie.domain.User;
import com.my.movie.domain.UserDto;
import com.my.movie.domain.UserGenre;

public interface UserDao {
	User selectUserLogin(User user);
	int selectUserId(UserDto userId);
	UserDto selectUserPw(UserDto pw);
	int selectUserNickname(UserDto nickname);
	int selectUserPhoneNum(UserDto phoneNum);
	int selectUserEmail(UserDto email);
	void insertUser(User user);
	void insertUserGenre(UserGenre userGenre);
	//재원
	String selectId1(User user);
	String selectPw1(User user);
	String selectPw1(String email, String userId);
	void updatePw1(String pw, String userId);
}