package com.my.movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.movie.dao.UserDao;
import com.my.movie.domain.User;
import com.my.movie.domain.UserDto;
import com.my.movie.domain.UserGenre;

@Service
public class UserServiceImpl implements UserService {
	@Autowired private UserDao userDao;

	@Override
	public User loginValidate(User user) {
		return userDao.selectUserLogin(user);
	}

	@Override
	public User getUser(User user) {
		return userDao.selectUser(user);
	}

	@Override
	public int getWithDrawal(int userNum) {
		return userDao.selectWithDrawal(userNum);
	}

	@Override
	public int checkUserId(UserDto userId) {
		return userDao.selectUserId(userId);
	}

	@Override
	public UserDto checkUserPw(UserDto pw) {
		return userDao.selectUserPw(pw);
	}

	@Override
	public int checkUserNickname(UserDto nickname) {
		return userDao.selectUserNickname(nickname);
	}

	@Override
	public int checkUserPhoneNum(UserDto phoneNum) {
		return userDao.selectUserPhoneNum(phoneNum);
	}

	@Override
	public int checkUserEmail(UserDto email) {
		return userDao.selectUserEmail(email);
	}

	@Override
	public void addUser(User user) {
		userDao.insertUser(user);
	}

	@Override
	public void addUserGenre(UserGenre userGenre) {
		userDao.insertUserGenre(userGenre);
	}


	@Override
	public void addWithDrawal(int userNum) {
		userDao.insertWithDrawal(userNum);
	}

//Àç¿ø
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
	public void fixPw1(String pw, String userId) {
		userDao.updatePw1(pw, userId);
	}
}