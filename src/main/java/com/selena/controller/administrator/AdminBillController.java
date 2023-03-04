package com.selena.controller.administrator;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.selena.controller.BaseController;
import com.selena.model.Product;
import com.selena.model.SaleOrder;
import com.selena.model.SaleOrderProducts;
import com.selena.service.BillProductService;
import com.selena.service.SaleOrderService;

@Controller
public class AdminBillController extends BaseController{
	@Autowired
	private SaleOrderService saleOrderService;

	@Autowired
	private BillProductService billProductService;
	
	@RequestMapping(value = ("/admin/bill/{id}"), method = RequestMethod.GET)
	public String viewBill(final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse response,
			@PathVariable("id") int id) throws IOException {
		SaleOrder Order =saleOrderService.searchOrder(id);
		model.addAttribute("bill", Order);
		
		List<SaleOrderProducts> productBill=billProductService.findBySaleOrderId(Order);
		List<Product> product=new ArrayList<>();
		for(int i=0;i<productBill.size();i++) {
			product.add(productBill.get(i).getProduct());
		}
		model.addAttribute("product", product);
		return "administrator/bill";
	}
}
