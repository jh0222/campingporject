package com.fi.pj.milkit;

import java.util.List;

import com.fi.pj.shopping.Page;
import com.fi.pj.shopping.ProductReview;

public interface MilkitMapper {
	
//밀키트목록
public List<Milkit> getAllMilkit();
//밀키트등록
public int regMilkit(Milkit fp);
//밀키트검색
public List<Milkit> MilkitSearch(Milkit fp);
//밀키트디테일
public Milkit getMilkit(Milkit fp);
//밀키트삭제
public int delMilkit(Milkit fp);
//밀키트수정
public int updateMilkit(Milkit fp);
//리뷰등록
public int regMilkitreview(MilkitReview fpr);
//리뷰(구매계정)
public int Milkitreview_id_select(MilkitReviewinsert fri);
//리뷰목록
public List<MilkitReview> getAllMilkitReview(String aa);
//리뷰삭제
public int delMilkitreview(MilkitReview fpr);
//리뷰수정
public int updateMilkitreview(MilkitReview fpr);
//장바구니등록
public int regMilkitbasket(MilkitBasket fpb);
//상품구매(등록)
public int regMilkitbuy(MilkitBuy mbuy);


}
