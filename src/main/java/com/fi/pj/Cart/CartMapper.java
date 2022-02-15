package com.fi.pj.Cart;

import java.util.List;

public interface CartMapper {

	// select는 List<Bean명>
	// insert, update, delete는 int
	
<<<<<<< HEAD
	public List<CartBean> BCcartlist(String bo1);

	public List<CartBean> BMcartlist(String bo2);

	public List<CartBean> Ccartlist(String v);

	public List<CartBean> Mcartlist(String vv);

	public int delCcartlist();
	
	public int delMcartlist();
=======
	public List<CartBean> showAllcampingcart();

	public List<CartBean> showAllmealkitcart();
>>>>>>> d3be522016e6e899d9a2e96f82e68725ec3f5622

}
