package com.example.backend.service;

import com.example.backend.entity.Product;
import java.util.List;

public interface ProductService {
    List<Product> findAll();
    Product findById(Long id);
    Product save(Product product);
    Product update(Long id, Product product);
    void delete(Long id);
    List<Product> findByCategory(String category);
} 