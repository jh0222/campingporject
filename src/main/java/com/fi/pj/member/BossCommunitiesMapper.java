package com.fi.pj.member;

import java.util.List;

public interface BossCommunitiesMapper {

	public BossCommunities campinginfo(BossCommunities bc);
	
	int campinginformationupdate(BossCommunities bc);

	int campinginfodel(BossCommunities bc);

	List<BossCommunities> campingreserve(BossCommunities bc);

	List<BossCommunities> pbuylist(BossCommunities bc);

	List<BossCommunities> mbuylist(BossCommunities bc);

	List<Communities> communities(BossCommunities bc);

	List<Communities> freeboard(BossCommunities bc);

	List<Communities> campingjjim(BossCommunities bc);

	int campingjjimdel(BossCommunities bc);

	List<Communities> campingtip(BossCommunities bc);

	List<Communities> recipe(BossCommunities bc);

	List<Communities> productreview(BossCommunities bc);

	List<Communities> mealreview(BossCommunities bc);

	int productreviewupdate(BossCommunities bc);

	int productreviewdel(BossCommunities bc);

	int mealreviewupdate(BossCommunities bc);

	int mealreviewdel(BossCommunities bc);

	List<Communities> freeboardreview(BossCommunities bc);

	int freeboardreviewupdate(BossCommunities bc);

	int freeboardreviewdel(BossCommunities bc);

	List<Communities> campingtipreview(BossCommunities bc);

	int campingtipreviewupdate(BossCommunities bc);

	int campingtipreviewdel(BossCommunities bc);

	List<Communities> recipereview(BossCommunities bc);

	int recipereviewupdate(BossCommunities bc);

	int recipereviewdel(BossCommunities bc);

	

	


	
}
