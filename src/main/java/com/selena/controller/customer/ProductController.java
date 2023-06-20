package com.selena.controller.customer;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.selena.controller.BaseController;
import com.selena.repository.CategoryRepository;
import com.selena.service.CategoriesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.selena.model.Product;
import com.selena.service.ProductService;

@Controller
public class ProductController extends BaseController {
	
	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryRepository categoryRepository;
	
	
	@RequestMapping(value={"/product"}, method = RequestMethod.GET)
	public String product(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@RequestParam("p") Optional<Integer> p) {
		Pageable pageable =PageRequest.of(p.orElse(0), 8);
		Page<Product> page=productService.findAll(pageable);
		List<Product> product=page.getContent();
		model.addAttribute("product", product);
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("currentPages", p.orElse(0));
		
		return "customer/product";
	}
	
	@RequestMapping(value={"/product/{productID}"}, method = RequestMethod.GET)
	public String productDesc(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("productID") int productID) {
		
		Pageable pageable =PageRequest.of(0, 4);
		Page<Product> page=productService.findAll(pageable);
		List<Product> products=page.getContent();
		model.addAttribute("products", products);
		model.addAttribute("totalPages", page.getTotalPages());

		Product product= productService.getById(productID);
		model.addAttribute("productId", product.getId());
		model.addAttribute("productTitle", product.getTitle());
		model.addAttribute("productPrice", product.getPrice());
		model.addAttribute("productAvatar", product.getAvatar());
		model.addAttribute("productDesc", product.getDetails());

		return "customer/productDesc";
	}
	@RequestMapping(value={"/product/viewDes"}, method = RequestMethod.GET)
	public String sortProductDes(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@RequestParam("p") Optional<Integer> p) {
		Sort sort = Sort.by("price").descending();
		Pageable pageable =PageRequest.of(p.orElse(0), 8,sort);
		Page<Product> page=productService.findAll(pageable);
		List<Product> products=page.getContent();
		model.addAttribute("product", products);
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("currentPages", p.orElse(0));
		
		return "customer/product";
	}
	@RequestMapping(value={"/product/viewAsc"}, method = RequestMethod.GET)
	public String sortProductAsc(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@RequestParam("p") Optional<Integer> p) {
		Sort sort = Sort.by("price").ascending();
		Pageable pageable =PageRequest.of(p.orElse(0), 8,sort);
		Page<Product> page=productService.findAll(pageable);
		List<Product> products=page.getContent();
		model.addAttribute("product", products);
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("currentPages", p.orElse(0));
		
		return "customer/product";
	}
	@RequestMapping(value={"/product/viewNameAsc"}, method = RequestMethod.GET)
	public String sortByNameProductAsc(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@RequestParam("p") Optional<Integer> p) {
		Sort sort = Sort.by("title").ascending();
		Pageable pageable =PageRequest.of(p.orElse(0), 8,sort);
		Page<Product> page=productService.findAll(pageable);
		List<Product> products=page.getContent();
		model.addAttribute("product", products);
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("currentPages", p.orElse(0));
		
		return "customer/product";
	}
	@RequestMapping(value={"/product/cate/{id}"}, method = RequestMethod.GET)
	public String getProductByCategory(final Model model,
									   final HttpServletRequest request,
									   final HttpServletResponse response,
									   @PathVariable("id") int id,
									   @Param("p") Optional<Integer> p){
		Sort sort = Sort.by("title").ascending();
		Pageable pageable =PageRequest.of(p.orElse(0), 8,sort);
		Page<Product> page=productService.findByCate(categoryRepository.findById(id), pageable);
		List<Product> products=page.getContent();
		model.addAttribute("product", products);
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("currentPages", p.orElse(0));

		return "customer/product";
	}
}
