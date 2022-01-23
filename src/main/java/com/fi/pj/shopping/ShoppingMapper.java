package com.fi.pj.shopping;

import java.util.List;

public interface ShoppingMapper {

	public List<Product> getAllProduct();

	public int regProduct(Product p);

	public List<Product> ProductSearch(Product p);

	public Product getProduct(Product p);

	public int delProduct(Product p);

	public Product detailProduct(Product p);

	public int updateProduct(Product p);

	public List<ProductReview> getAllProductReview();

	public int Productreview_id_select(Reviewinsert ri);
	
}
