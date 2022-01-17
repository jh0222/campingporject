package com.fi.pj.shopping;

import java.util.List;

public interface ShoppingMapper {

	public List<Product> getAllProduct();

	public int regProduct(Product p);

	public List<Product> ProductSearch(Product p);

	public Product getProduct(Product p);

	public int delProduct(Product p);

	public Product detailProduct(Product p);
	
}
