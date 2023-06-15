package com.selena.repository;

import com.selena.model.SaleOrder;
import com.selena.model.SaleOrderProducts;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SaleOrderProductRepository extends JpaRepository<SaleOrderProducts,Integer> {
    List<SaleOrderProducts> findBySaleOrder(SaleOrder saleOrderId);
}
