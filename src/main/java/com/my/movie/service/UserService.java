package com.my.movie.service;

import com.my.movie.domain.User;
import com.my.movie.domain.UserDto;
import com.my.movie.domain.UserGenre;

public interface UserService {
	User loginValidate(User user);
	int checkUserId(UserDto userId);
	UserDto checkUserPw(UserDto pw);
	int checkUserNickname(UserDto nickname);
	int checkUserPhoneNum(UserDto phoneNum);
	int checkUserEmail(UserDto email);
	void addUser(User user);
	void addUserGenre(UserGenre userGenre);
	//재원
	String findId1(User user);
	String findPw1(User user);
	String findPw1(String email, String userId);
	void fixPw1(String pw, String userId);
}