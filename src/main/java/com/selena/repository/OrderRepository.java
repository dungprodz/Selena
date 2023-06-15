
package com.selena.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.selena.model.Product;
import com.selena.model.SaleOrder;


@Repository
public interface OrderRepository extends JpaRepository<SaleOrder, Integer>{

	@Query("SELECT o FROM SaleOrder o WHERE o.id=:id")
	SaleOrder searchOrder( @Param("id") int id);
}
