package com.fi.pj.shopping;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fi.pj.member.UserMember;

public interface ShoppingMapper {
	//상품목록
	public List<Product> getAllProduct(); 
	//상품등록
	public int regProduct(Product p); 
	//상품검색
	public List<Product> ProductSearch(Product p); 
	//상품디테일
	public Product getProduct(Product p);
	//상품삭제
	public int delProduct(Product p);
	//상품수정
	public int updateProduct(Product p);
	//상품리뷰목록
	public List<ProductReview> getAllProductReview();
	//상품리뷰(구매계정)
	public int Productreview_id_select(Reviewinsert ri);
	//상품리뷰등록
	public int regProductreview(ProductReview pr);
	//상품리뷰삭제
	public int delProductreview(ProductReview pr);
	//상품리뷰수정
	public int updateProductreview(ProductReview pr);
	//상품리뷰수정(리뷰등록계정)
//	public int Productreview_id_select2(ProductReview pr); 
	
	//장바구니등록
	public int regProductbasket(ProductBasket pb); //장바구니 등록
	//상품구매(등록)
	public int regProductbuy(ProductBuy pbuy);
	
}
