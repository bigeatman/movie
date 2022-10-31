package com.my.movie.service;

import javax.servlet.http.HttpSession;

import com.my.movie.domain.User;

public interface UserService {
	User selectUser(User user, HttpSession session);
	void logout(HttpSession session);
}