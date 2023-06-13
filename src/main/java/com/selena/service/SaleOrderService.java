package com.selena.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.selena.model.Product;
import com.selena.model.SaleOrder;
import com.selena.repository.OrderRepository;

@Service
public class SaleOrderService extends BaseService<SaleOrder>{
	
	@Autowired
	private OrderRepository orderRepository;
	
	@Override
	protected Class<SaleOrder> clazz() {
		// TODO Auto-generated method stub
		return null;
	}

	public Page<SaleOrder> findAll(Pageable pageable) {
		return orderRepository.findAll(pageable);
	}

	public SaleOrder findById(int id) {
		return orderRepository.findById(id).get();
	}

	public List<SaleOrder> searchOrder(int id) {
		return orderRepository.searchOrder(id);
	}
	
	
}
