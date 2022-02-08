package com.fi.pj.member;

import java.util.List;

public interface CommunitiesMapper {
	
	List<Communities> communities(Communities c);
	
	List<Communities> freeboard(Communities c);

	List<Communities> campingjjim(Communities c);

	List<Communities> campingreserve(Communities c);

	List<Communities> campingtip(Communities c);

	List<Communities> recipe(Communities c);

	List<Communities> campingreview(Communities c);

	List<Communities> productreview(Communities c);

	List<Communities> mealreview(Communities c);
	
	List<Communities> freeboardreview(Communities c);

	List<Communities> campingtipreview(Communities c);

	List<Communities> recipereview(Communities c);

	int campingreservedel(Communities c);

	int campingjjimdel(Communities c);

}
