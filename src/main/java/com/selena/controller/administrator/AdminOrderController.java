package com.selena.controller.administrator;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.selena.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.selena.controller.BaseController;

import com.selena.model.SaleOrder;

import com.selena.service.BillProductService;
import com.selena.service.SaleOrderService;

@Controller
public class AdminOrderController extends BaseController {
	@Autowired
	private SaleOrderService saleOrderService;

	@Autowired
	private OrderRepository orderRepository;

	@RequestMapping(value = ("/admin/order"), method = RequestMethod.GET)
	public String getOrder(final Model model,
						   @RequestParam("p") Optional<Integer> p) {
		Sort sort = Sort.by("id").descending();
		Pageable page = PageRequest.of(p.orElse(0), 8, sort);
		Page<SaleOrder> Order = saleOrderService.findAll(page);
		List<SaleOrder> Orders = Order.getContent();
		model.addAttribute("order", Orders);
		model.addAttribute("totalPages", Order.getTotalPages());
		model.addAttribute("currentPages", p.orElse(0));
		return "administrator/order";
	}

	@RequestMapping(value = ("/admin/order/{id}"), method = RequestMethod.POST)
	public String searchOrder(final HttpServletRequest request, @PathVariable("id") int id)
			throws IOException {
		String status = request.getParameter("status");
		SaleOrder saleOrder = orderRepository.searchOrder(id);
		saleOrder.setStatus(status);
		orderRepository.save(saleOrder);
		return "redirect:/admin/order";
	}
	
}
