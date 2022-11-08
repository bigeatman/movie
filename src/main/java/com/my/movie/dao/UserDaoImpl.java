package com.my.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.UserMap;
import com.my.movie.domain.User;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired private UserMap userMap;

	@Override
	public User selectUser(User user) {
		return userMap.selectUser(user);
	}

	@Override
	public int selectWithDrawal(int userNum) {
		return userMap.selectWithDrawal(userNum);
	}

	@Override
	public int selectUserId(String userId) {
		int result = userMap.selectUserId(userId);
		return result;
	}

	@Override
	public int selectUserPw(String pw) {
		int result = userMap.selectUserPw(pw);
		return result;
	}

	@Override
	public int selectUserNickname(String nickname) {
		int result = userMap.selectUserNickname(nickname);
		return result;
	}

	@Override
	public int selectUserPhoneNum(String phoneNum) {
		int result = userMap.selectUserPhoneNum(phoneNum);
		return result;
	}

	@Override
	public int selectUserEmail(String email) {
		int result = userMap.selectUserEmail(email);
		return result;
	}

	@Override
	public List<String> selectUserGenre(int genreNum) {
		return userMap.selectUserGenre(genreNum);
	}

	@Override
	public void insertUser(User user) {
		userMap.insertUser(user);
	}

	@Override
	public void insertUserGenre(int genreNum) {
		userMap.insertUserGenre(genreNum);
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