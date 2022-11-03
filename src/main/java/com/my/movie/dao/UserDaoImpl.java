package com.my.movie.dao;

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
}