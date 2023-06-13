package com.selena.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.selena.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>{
	
	@Query("SELECT p FROM Product p WHERE p.title LIKE CONCAT('%', :name, '%')")
	List<Product> searchProduct( @Param("name") String name);
}
