package com.my.movie.service;

import java.util.List;

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
}