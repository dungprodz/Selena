package com.selena.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.selena.model.User;
import com.selena.repository.UserRepository;


@Service
public class UserService extends BaseService<User> {
	@Autowired
	private UserRepository userRepository;
	
	@Override
	protected Class<User> clazz() {
		return User.class;
	}

	public User loadUserByUsername(String userName) {
		return userRepository.getUserByUsername(userName);
	}
	
	
}