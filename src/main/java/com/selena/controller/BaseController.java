package com.selena.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.selena.model.Categories;
import com.selena.model.User;
import com.selena.service.CategoriesService;


public abstract class BaseController {
	@Autowired
	private CategoriesService categoriesService;
	
	@ModelAttribute("categories")
	public List<Categories> getAllCategories() {
		return categoriesService.findAll();
	}
	@ModelAttribute("userLogined")
	public User getUserLogined() {
		Object userLogined=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined != null && userLogined instanceof UserDetails) {
			return (User) userLogined;
		}
		return new User();
	}
}
