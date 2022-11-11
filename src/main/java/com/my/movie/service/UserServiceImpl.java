package com.my.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.movie.dao.UserDao;
import com.my.movie.domain.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired private UserDao userDao;

	@Override
	public User loginValidate(User user) {
		return userDao.selectUser(user);
	}

	@Override
	public int getWithDrawal(int userNum) {
		return userDao.selectWithDrawal(userNum);
	}

	@Override
	public int checkUserId(String userId) {
		return userDao.selectUserId(userId);
	}

	@Override
	public int checkUserPw(String pw) {
		return userDao.selectUserPw(pw);
	}

	@Override
	public int checkUserNickname(String nickname) {
		return userDao.selectUserNickname(nickname);
	}

	@Override
	public int checkUserPhoneNum(String phoneNum) {
		return userDao.selectUserPhoneNum(phoneNum);
	}

	@Override
	public int checkUserEmail(String email) {
		return userDao.selectUserEmail(email);
	}

	@Override
	public List<String> getUserGenre(int userNum) {
		return userDao.selectUserGenre(userNum);
	}

	@Override
	public void addUser(User user) {
		userDao.insertUser(user);
	}

	@Override
	public void addUserGenre(int genreNum) {
		userDao.insertUserGenre(genreNum);
	}

	@Override
	public void addWithDrawal(int userNum) {
		userDao.insertWithDrawal(userNum);
	}

//���
	@Override
	public String findId1(User user) {
		return userDao.selectId1(user);
	}
	
	@Override
	public String findPw1(User user) {
		return userDao.selectPw1(user);
	}
	
	@Override
	public String findPw1(String email, String userId) {
		return userDao.selectPw1(email, userId);
	}
	
	@Override
	public void fixPw1(User user) {
		userDao.updatePw1(user);
	}
}