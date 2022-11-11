package com.my.movie.service;

import java.util.List;

import com.my.movie.domain.User;

public interface UserService {
	User loginValidate(User user);
	int getWithDrawal(int userNum);
	int checkUserId(String userId);
	int checkUserPw(String pw);
	int checkUserNickname(String nickname);
	int checkUserPhoneNum(String phoneNum);
	int checkUserEmail(String email);
	List<String> getUserGenre(int userNum);
	void addUser(User user);
	void addUserGenre(int genreNum);
	void addWithDrawal(int userNum);
	//���
	String findId1(User user);
	String findPw1(User user);
	String findPw1(String email, String userId);
	void fixPw1(User user);
}