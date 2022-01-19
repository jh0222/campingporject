package com.fi.mj;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CampingPlaceDAO {

	@Autowired
	private SqlSession ss;
	
	public void getAllMsg(HttpServletRequest req) {
		
		ss.getMapper(PlacePayMapper.class).getAllPlace();
	}

}
