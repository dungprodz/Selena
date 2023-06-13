package com.selena.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.selena.model.SaleOrder;
import com.selena.model.SaleOrderProducts;
import com.selena.repository.BillRepository;

@Service
public class BillProductService extends BaseService<SaleOrderProducts> {
	
	@Autowired
	private BillRepository billRepository;
	
	@Override
	protected Class<SaleOrderProducts> clazz() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<SaleOrderProducts> findBySaleOrderId(int saleOrderId) {
		return billRepository.findBySaleOrderID(saleOrderId);
	}
	
	
}
