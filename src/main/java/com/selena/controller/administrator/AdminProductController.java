package com.selena.controller.administrator;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.selena.controller.BaseController;
import com.selena.dto.Cart;
import com.selena.dto.ProductSearch;
import com.selena.model.Product;
import com.selena.service.BaseService;
import com.selena.service.PagerData;
import com.selena.service.ProductService;

@Controller
public class AdminProductController extends BaseController {
	@Autowired
	private ProductService productService;
	

	@RequestMapping(value = { "/admin/product/{productId}" }, method = RequestMethod.GET)
	public String adminProductDetail(final Model model, 
							   		 final HttpServletRequest request,
								   	 final HttpServletResponse response, 
								   	 @PathVariable("productId") int productId) throws IOException {

		// lấy product trong db theo ProductId
		Product productInDatabase = productService.getById(productId);
		model.addAttribute("product", productInDatabase);
		
		return "administrator/product";
		
	}
	
	@RequestMapping(value = { "/admin/product" }, method = RequestMethod.GET)
	public String adminProductAdd(final Model model, 
								  final HttpServletRequest request,
							  	  final HttpServletResponse response) throws IOException {
		// khởi tạo 1 product(entity) mới
		Product newProduct = new Product();
		model.addAttribute("product", newProduct); // đẩy data xuống view
		
		// trả về view
		return "administrator/product";
	}
	
	@RequestMapping(value = { "/admin/product" }, method = RequestMethod.POST)
	public String adminProductAddOrUpdate(final Model model, 
										  final HttpServletRequest request,
										  final HttpServletResponse response, 
										  @ModelAttribute("product") Product product, //spring-form binding
										  @RequestParam("productAvatar") MultipartFile productAvatar,
										  @RequestParam("productPictures") MultipartFile[] productPictures) throws Exception {
		// kiểm tra xem thông tin product đẩy lên khi click submit nên là tạo mới hay chỉnh sửa
		if(product.getId() != null && product.getId() > 0) { //chỉnh sửa sản phẩm
			productService.updateProduct(product, productAvatar, productPictures);
		} else { //thêm mới
			productService.saveProduct(product, productAvatar, productPictures);	
		}
		
		return "redirect:/admin/product/list";
	}

	@RequestMapping(value = { "/admin/product/list" }, method = RequestMethod.GET)
	public String adminProductList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		// lấy thông tin từ request param
		String keyword = request.getParameter("keyword");
		Integer categoryId = 0;
		try {
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		} catch (Exception e) { };
		Integer currentPage = BaseService.NO_PAGING; //mặc định luôn là page số 1
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) { };
				
		// set các giá trị lấy được vào ProductSearch dto
		ProductSearch productSearch = new ProductSearch();
		productSearch.setKeyword(keyword);
		productSearch.setCategoryId(categoryId);
		productSearch.setCurrentPage(currentPage);
		
		PagerData<Product> products = productService.searchProduct(productSearch);;
		model.addAttribute("productSearch", productSearch);
		model.addAttribute("products", products);
		return "administrator/product_list";
		
	}
	
	
	@RequestMapping(value = {"/delete/{id}"} , method = RequestMethod.GET)
	public String deleteProduct(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("id") int id) throws IOException {
		
		productService.deleteProduct(id);
		return "redirect:/admin/product/list";
	}
}
