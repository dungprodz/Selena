package com.selena.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


import com.selena.model.SaleOrderProducts;

@Repository
public interface BillRepository extends JpaRepository<SaleOrderProducts, Integer>{
	
	@Query("SELECT s FROM SaleOrderProducts s WHERE s.saleOrder= ?1")
	List<SaleOrderProducts> findBySaleOrderID(int id);
	
}
