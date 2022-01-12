package com.fi.pj.shopping;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ShoppingDAO {
	
	@Autowired
	private  SqlSession ss;

	public void getAllProduct(HttpServletRequest req) {
																			
		req.setAttribute("products",ss.getMapper(ShoppingMapper.class).getAllProduct());
		
	}

	public void regProduct(Product p, HttpServletRequest req) {
		// TODO Auto-generated method stub
		
	}


}
