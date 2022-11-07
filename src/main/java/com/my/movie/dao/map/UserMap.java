package com.my.movie.dao.map;

import org.apache.ibatis.annotations.Param;

import com.my.movie.domain.User;
import com.my.movie.domain.UserDto;
import com.my.movie.domain.UserGenre;

public interface UserMap {
	User selectUserLogin(User user);
	User selectUser(User user);
	int selectWithDrawal(int userNum);
	int selectUserId(UserDto userId);
	UserDto selectUserPw(UserDto pw);
	int selectUserNickname(UserDto nickname);
	int selectUserPhoneNum(UserDto phoneNum);
	int selectUserEmail(UserDto email);
	void insertUser(User user);
	void insertUserGenre(UserGenre userGenre);
	void insertWithDrawal(int userNum);.
	//Àç¿ø
	String selectId1(User user);
	String selectPw1(User user);
	String selectPw1(@Param("email")String email,
						@Param("userId")String userId);
	void updatePw1(@Param("pw")String pw,
			@Param("userId")String userId);
	
}