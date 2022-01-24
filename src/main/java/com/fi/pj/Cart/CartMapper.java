package com.fi.pj.Cart;

import java.util.List;

public interface CartMapper {

	// select는 List<Bean명>
	// insert, update, delete는 int
	
	public List<CartBean> Ccartlist(String val);

	public List<CartBean> Mcartlist(String v);
/*
	public int deleteCcartlist();
	
	public int deleteMcartlist();
*/
}
