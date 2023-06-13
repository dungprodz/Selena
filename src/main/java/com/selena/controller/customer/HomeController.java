package com.selena.controller.customer;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.selena.model.Product;
import com.selena.service.PagerData;
import com.selena.service.ProductService;



@Controller
public class HomeController {
	
	@Autowired
	private ProductService productService;
	
	
	@RequestMapping(value={"/home"}, method = RequestMethod.GET)
	public String pagination(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@RequestParam("p") Optional<Integer> p) throws IOException {
		Pageable pageable =PageRequest.of(p.orElse(0), 8);
		Page<Product> page=productService.findAll(pageable);
		List<Product> product=page.getContent();
		model.addAttribute("product", product);
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("currentPages", p.orElse(0));
		
		return "customer/home";
	}
	
	@RequestMapping(value={"/home"}, method = RequestMethod.POST)
	public String searchProduct(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response
			) throws IOException {
		
		String keyword = request.getParameter("name");
		List<Product> products=productService.searchProductByName(keyword);
		model.addAttribute("product", products);
		return "customer/home";
	}
}
