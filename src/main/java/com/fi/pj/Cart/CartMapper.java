package com.fi.pj.Cart;

import java.util.List;

public interface CartMapper {

	// select는 List<Bean명>
	// insert, update, delete는 int
	
	public List<CartBean> showAllcampingcart();

	public List<CartBean> showAllmealkitcart();

}
