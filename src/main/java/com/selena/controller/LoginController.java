package com.selena.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.selena.model.Categories;
import com.selena.model.User;
import com.selena.repository.UserRepository;
import com.selena.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class LoginController {
	@Autowired
	private UserRepository userService;
	@RequestMapping(value = {"/login"}, method = RequestMethod.GET)
	public String login(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		return "login";
	}

//	@RequestMapping(value = {"/listUser"}, method = RequestMethod.GET)
//	public List<User> listUser(final Model model,
//						 final HttpServletRequest request,
//						 final HttpServletResponse response) throws IOException {
//		return userService.findAll();
//	}
}
