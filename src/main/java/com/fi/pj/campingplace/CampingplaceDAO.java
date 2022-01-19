package com.fi.pj.campingplace;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class CampingplaceDAO {

	@Autowired
	private SqlSession ss;
	
	public void getAllPlace(HttpServletRequest req) {
		req.setAttribute("places", ss.getMapper(PlaceMapper.class).getAllPlace());
	}
	
	public void regPlace(Campingplace p, HttpServletRequest req) {
		
	}
	
}
