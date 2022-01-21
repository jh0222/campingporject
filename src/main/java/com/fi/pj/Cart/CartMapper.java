package com.fi.pj.Cart;

import java.util.List;

public interface CartMapper {

	// select는 List<Bean명>
	// insert, update, delete는 int
	
	public List<CartBean> Ccartlist();

	public List<CartBean> Mcartlist();
/*
	public int deleteCcartlist();
	
	public int deleteMcartlist();
*/
}
