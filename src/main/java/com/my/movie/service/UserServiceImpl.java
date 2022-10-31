package com.my.movie.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.movie.dao.UserDao;
import com.my.movie.domain.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired private UserDao userDao;

	@Override
	public User selectUser(User user, HttpSession session) {
		User userLogin = userDao.selectUser(user);
		session.setAttribute("userId", user.getUserId());
		session.setAttribute("pw", user.getPw());
		return userLogin;
	}
	
	@Override
	public void logout(HttpSession session) {
		session.invalidate(); 
	}
}