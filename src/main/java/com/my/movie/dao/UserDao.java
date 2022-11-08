package com.my.movie.dao;

import java.util.List;

import com.my.movie.domain.User;

public interface UserDao {
	User selectUser(User user);
	int selectWithDrawal(int userNum);
	int selectUserId(String userId);
	int selectUserPw(String pw);
	int selectUserNickname(String nickname);
	int selectUserPhoneNum(String phoneNum);
	int selectUserEmail(String email);
	List<String> selectUserGenre(int genreNum);
	void insertUser(User user);
	void insertUserGenre(int genreNum);
	void insertWithDrawal(int userNum);
	String selectId1(User user);
	String selectPw1(User user);
	String selectPw1(String email, String userId);
	void updatePw1(User user);
}