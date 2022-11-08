package com.my.movie.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.UserMap;
import com.my.movie.domain.User;
import com.my.movie.domain.UserDto;
import com.my.movie.domain.UserGenre;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired private UserMap userMap;

	@Override
	public User selectUserLogin(User user) {
		return userMap.selectUserLogin(user);
	}

	@Override
	public User selectUser(User user) {
		return userMap.selectUser(user);
	}

	@Override
	public int selectWithDrawal(int userNum) {
		return userMap.selectWithDrawal(userNum);
	}

	@Override
	public int selectUserId(UserDto userId) {
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
	
	@Override
	public void insertUser(User user) {
		userMap.insertUser(user);
	}

	@Override
	public void insertUserGenre(UserGenre userGenre) {
		userMap.insertUserGenre(userGenre);
	}

	@Override
	public void insertWithDrawal(int userNum) {
		userMap.insertWithDrawal(userNum);
	}

//���
	@Override
	public String selectId1(User user) {
		return userMap.selectId1(user);
	}
	
	@Override
	public String selectPw1(User user) {
		return userMap.selectPw1(user);
	}
	
	@Override
	public String selectPw1(String email, String userId) {
		return userMap.selectPw1(email, userId);
	}
	
	@Override
	public void updatePw1(String pw, String userId) {
		userMap.updatePw1(pw, userId);
	}
}