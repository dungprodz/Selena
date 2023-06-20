package com.selena.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.selena.model.Categories;


@Repository
public interface CategoryRepository extends JpaRepository<Categories, Integer> {
    Categories findById(int name);
}
