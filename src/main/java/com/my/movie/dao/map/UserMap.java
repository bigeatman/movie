package com.my.movie.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.movie.domain.User;

public interface UserMap {
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
	String selectPw1(@Param("email")String email,
						@Param("userId")String userId);
	void updatePw1(@Param("pw")String pw,
			@Param("userId")String userId);
}