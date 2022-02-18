package com.fi.pj.shopping;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fi.pj.member.UserMember;
import com.fi.pj.milkit.MilkitReviewinsert;

public interface ShoppingMapper {
	//상품목록
	public List<Product> getAllProduct(Page p); 
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
	public List<ProductReview> getAllProductReview(String aa);
	//상품리뷰(구매계정)
	public int Productreview_id_select(Reviewinsert ri);
	//상품리뷰등록
	public int regProductreview(ProductReview pr);
	//상품리뷰삭제
	public int delProductreview(ProductReview pr);
	//상품리뷰수정
	public int updateProductreview(ProductReview pr);
	//장바구니등록
	public int regProductbasket(ProductBasket pb); 
	//상품구매(등록)
	public int regProductbuy(ProductBuy pbuy);
	//총 상품 게시물 수 
	public int getAllProductcnt();
	//상품랭킹
	public List<ProductRank> ProductRank();
	
}
