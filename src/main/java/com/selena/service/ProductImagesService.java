package com.selena.service;

import org.springframework.stereotype.Service;

import com.selena.model.ProductImages;



@Service
public class ProductImagesService extends BaseService<ProductImages> {

	@Override
	protected Class<ProductImages> clazz() {
		return ProductImages.class;
	}

}
