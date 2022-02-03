package com.fi.pj.member;

import java.util.List;

public interface BuylistMapper {

	List<Buy> userbuylist(Buy b);

	List<Buy> mealbuylist(Buy b);

	public int userbuydel(Buy b);
	
}
