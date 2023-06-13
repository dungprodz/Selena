package com.selena.controller.customer;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.selena.controller.BaseController;
import com.selena.model.Role;
import com.selena.model.SaleOrder;
import com.selena.model.User;
import com.selena.repository.RoleRepository;
import com.selena.service.UserService;

@Controller
public class RegisterController extends BaseController{
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@RequestMapping(value = ("/register"), method = RequestMethod.GET)
	public String register(final Model model, final HttpServletRequest request, final HttpServletResponse response) throws IOException {
		
		return "customer/register";
	}
	
	@RequestMapping(value = ("/register"), method = RequestMethod.POST)
	public String signIn(final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse response) throws IOException {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(4);
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		User user = new User();
		
		
		Role role=roleRepository.findByName("GUEST");
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setPhone(phone);
		user.addRoles(role);
		userService.saveOrUpdate(user);
		
		String encodePassword= encoder.encode(user.getPassword());
		user.setPassword(encodePassword);
		userService.saveOrUpdate(user);
		
		return "redirect:/home";
	}
	
}
