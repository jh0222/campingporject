package com.fi.pj.Cart;

import java.util.List;

public interface CartMapper {

	// select는 List<Bean명>
	// insert, update, delete는 int

	// 캠핑용품 장바구니 목록 조회
	public List<CartBean> campingproduct(CartBean c);

	// 캠핑용품 수량 수정
	public int cartup(CartBean c);

	// 캠핑용품 하나 삭제
	public int cartdel(CartBean c);

	// 캠핑용품 여러개 선택 삭제
	public int selectdel(String no);

	// 밀키트 장바구니 목록 조회
	public List<CartBean> mealkit(CartBean c);

	// 밀키트 수량 수정
	public int mealkitup(CartBean c);

	// 밀키트 하나 삭제
	public int mealkitdel(CartBean c);

	// 밀키트 여러개 선택 삭제
	public int mealkitSelectdelete(String no);

}
