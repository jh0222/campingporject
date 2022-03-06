package com.fi.pj.Cart;

import java.util.List;

public interface CartMapper {

	// select는 List<Bean명>
	// insert, update, delete는 int

	public List<CartBean> campingproduct(CartBean c);

	public List<CartBean> mealkit(CartBean c);

	public int cartup(CartBean c);

	public int mealkitup(CartBean c);

	public int cartdel(CartBean c);

	public int selectdel(String no);


}
