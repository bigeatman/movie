package com.my.movie.dao;

import com.my.movie.domain.User;

public interface UserDao {
	User selectUser(User user);
}