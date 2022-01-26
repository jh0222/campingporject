package com.fi.pj.Mypage;

import java.util.List;

public interface MypageMapper {

	public Information getUserinformation(String u_id);
	
	public Object getManagerinformation();

	public List<Reservation> getUreservelist(String u_id);


	

}
