package com.selena.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.selena.model.Categories;
import com.selena.repository.CategoryRepository;

@Service
public class CategoriesService extends BaseService<Categories> {
	@Autowired
	CategoryRepository categoryRepository;

	@Override
	protected Class<Categories> clazz() {
		return Categories.class;
	}

	public List<Categories> findAll() {
		return categoryRepository.findAll();
	}
	
	
}
