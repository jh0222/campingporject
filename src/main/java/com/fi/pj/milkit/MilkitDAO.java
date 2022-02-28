package com.fi.pj.milkit;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fi.pj.member.BossMember;
import com.fi.pj.member.Root;
import com.fi.pj.member.UserMember;
import com.fi.pj.shopping.Page;
import com.fi.pj.shopping.Product;
import com.fi.pj.shopping.Reviewinsert;
import com.fi.pj.shopping.ShoppingMapper;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class MilkitDAO {
	
	@Autowired
	private  SqlSession ss;

//밀키트 목록
	public void getAllMilkit(HttpServletRequest req) {
		int rowSize = 15; // 한페이지에 보여줄 글의 수
		int pg = 1; // 페이지 , list.jsp로 넘어온 경우 , 초기값 =1

		String strPg = req.getParameter("pg");
		if (strPg != null) { // list.jsp?pg=2
			pg = Integer.parseInt(strPg); // .저장
		}

		int from = (pg * rowSize) - (rowSize - 1); // (1*10)-(10-1)=10-9=1 //from
		int to = (pg * rowSize); // (110) = 10 //to

		Page p = new Page();
		p.setFrom(from);
		p.setTo(to);

		List<Milkit> milkits = ss.getMapper(MilkitMapper.class).getAllMilkit(p);

		int total = ss.getMapper(MilkitMapper.class).getAllMilkitcnt(); // 총 게시물 수
		int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
		// int totalPage = total/rowSize + (total%rowSize==0?0:1);
		int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>

		int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작
		int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
		if (toPage > allPage) { // 예) 20>17
			toPage = allPage;
		}

		req.setAttribute("pg", pg);
		req.setAttribute("block", block);
		req.setAttribute("fromPage", fromPage);
		req.setAttribute("toPage", toPage);
		req.setAttribute("allPage", allPage);
		req.setAttribute("milkits", milkits);	
		
		
	}

//밀키트 등록
	public void regMilkit(Milkit fp, HttpServletRequest req) {
		try { 
			
			String path = req.getSession().getServletContext().getRealPath("resources/img");
			System.out.println(path);
			
			MultipartRequest mr = new MultipartRequest(req, path, 31457280, "utf-8", new DefaultFileRenamePolicy());
			
			
			
			String name = mr.getParameter("fp_name");
			int price = Integer.parseInt(mr.getParameter("fp_price"));
			String txt = mr.getParameter("fp_txt");
			String picture = mr.getFilesystemName(("fp_picture"));
			
			
			System.out.println(name);
			System.out.println(price);
			System.out.println(txt);
			System.out.println(picture);
			
								
			fp.setFp_name(name);
			fp.setFp_picture(picture);
			fp.setFp_price(price);
			fp.setFp_txt(txt); 
			
			if(ss.getMapper(MilkitMapper.class).regMilkit(fp) == 1) { 
				System.out.println("등록 성공");
				req.setAttribute("r", "등록 성공!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "db서버문제..");
			
		}
		
	}

//밀키트 검색
	
	public void searchMilkit(Milkit fp, HttpServletRequest req) {
		
		req.setAttribute("milkits",ss.getMapper(MilkitMapper.class).MilkitSearch(fp)); 
		
	}

//밀키트 삭제	
	public void delMilkit(Milkit fp, HttpServletRequest req) {
		try { 
			String path = req.getSession().getServletContext().getRealPath("resources/img");
			System.out.println(path);
			Milkit fpfp = ss.getMapper(MilkitMapper.class).getMilkit(fp); 
			System.out.println(fpfp.getFp_picture()); 
			String fileName = fpfp.getFp_picture();
			File f = new File(path + "/" + fileName);
			
			if(ss.getMapper(MilkitMapper.class).delMilkit(fp) == 1) { 
				System.out.println("삭제 성공");
				f.delete(); 
				req.setAttribute("r", "삭제 성공!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "db서버문제..");
			
		}
		
	}

	
	
	public void getMilkit(Milkit fp, HttpServletRequest req) {
		MilkitMapper mm = ss.getMapper(MilkitMapper.class); 
		Milkit milkit = mm.getMilkit(fp);  
		req.setAttribute("fp", milkit );
		//위에 소스를 한줄로 표현하면 -> req.setAttribute("fp",ss.getMapper(MilkitMapper.class).getMilkit(fp)); 
		
	}
	
	//리뷰목록
	public void getAllMilkitReview(HttpServletRequest req) {
		String fprno = req.getParameter("fpr_fp_no");
		
		req.setAttribute("milkitreviews",ss.getMapper(MilkitMapper.class).getAllMilkitReview(fprno));
		
	}

	public void updateMilkit(Milkit fp, HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/img");
        MultipartRequest mr = null;
        try {
            mr = new MultipartRequest(req, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("result", "등록실패");
            return;
        }

        try {
        	String name = mr.getParameter("fp_name");
			int price = Integer.parseInt(mr.getParameter("fp_price"));
			String txt = mr.getParameter("fp_txt");
			String newpicture = mr.getFilesystemName("fp_picture2");
			String oldpicture = mr.getParameter("fp_picture");
			
			fp.setFp_name(name); 
			fp.setFp_price(price);
			fp.setFp_txt(txt); 
			if(newpicture != null) {
                fp.setFp_picture(newpicture);
            } else {
            	fp.setFp_picture(oldpicture);
            }
			
			if(ss.getMapper(MilkitMapper.class).updateMilkit(fp) == 1) { 				
				req.setAttribute("r", "수정 성공!");
			} else {
				req.setAttribute("result", "수정실패");
			}
			
        } catch (Exception e) {
            e.printStackTrace();
            String fileName = mr.getFilesystemName("fp_picture2");
            new File(path + "/" + fileName).delete();
            req.setAttribute("result", "수정실패");
        }
		
	}
	//리뷰등록
	public void regMilkitreview(MilkitReview fpr, HttpServletRequest req) {
		System.out.println(fpr.getFpr_fp_no() + "상품번호(fp_no)출력");
		System.out.println(fpr.getFpr_u_bo_id() + "리뷰등록(id출력)");
		if(ss.getMapper(MilkitMapper.class).regMilkitreview(fpr) == 1) { 
			System.out.println("등록성공");
			req.setAttribute("r", "등록 성공");
		} else {
			req.setAttribute("r", "등록 실패..");
		}
		
	}
	//(구매계정)리뷰등록
	public void reviewwrite2(MilkitReviewinsert fri, Milkit fp, HttpServletRequest req) {
		UserMember u_member = (UserMember) req.getSession().getAttribute("loginMember");
		BossMember b_member = (BossMember) req.getSession().getAttribute("loginMember2");
		Root r_member = (Root) req.getSession().getAttribute("loginMember3");

		if (u_member != null) {
			fri.setId(u_member.getU_id());
		}
		if (b_member != null) {
			fri.setId(b_member.getBo_id());
		}
		if (r_member != null) {
			fri.setId(r_member.getRoot_id());
		}
		System.out.println(fri.getId());
		System.out.println(fri.getId());
		System.out.println(fri.getId());
		 
		if(ss.getMapper(MilkitMapper.class).Milkitreview_id_select(fri) >= 1) {
			req.setAttribute("reviewPage", "../shopping_milkit/milkit_review.jsp");
		}
		
		
		
		
		
		
		
		
		
	}

	public void delMilkitreview(MilkitReview fpr, HttpServletRequest req) {
		if (ss.getMapper(MilkitMapper.class).delMilkitreview(fpr) == 1) {  
			System.out.println("삭제성공");
			req.setAttribute("r", "삭제 성공");
		} else {
			req.setAttribute("r", "삭제 실패..");
		}
		
	}

	public void updateMilkitreview(MilkitReview fpr, HttpServletRequest req) {
		if (ss.getMapper(MilkitMapper.class).updateMilkitreview(fpr) == 1) {  
			System.out.println("리뷰수정 성공");
			req.setAttribute("r", "수정 성공");
		} else {
			req.setAttribute("r", "수정 실패..");
		}
		
	}

	public void regBasketbasket(MilkitBasket fpb, HttpServletRequest req) {
		try { 
			
			System.out.println(fpb.getFba_fp_no());
			System.out.println(fpb.getFba_fp_name());
			System.out.println(fpb.getFba_fp_picture());
			System.out.println(fpb.getFba_number());
			System.out.println(fpb.getFba_u_bo_id());
			System.out.println(fpb.getFba_no());
			
			
			if(ss.getMapper(MilkitMapper.class).regMilkitbasket(fpb) == 1) { 
				System.out.println("등록 성공");
				req.setAttribute("r", "등록 성공!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "db서버문제..");
			
		}
		
	}

	public void regMilkitbuy(MilkitBuy mbuy, HttpServletRequest req) {
try { 
			
			System.out.println(mbuy.getFb_u_bo_id());
			System.out.println(mbuy.getFb_fp_no());
			System.out.println(mbuy.getFb_fp_name());
			System.out.println(mbuy.getFb_price());
			System.out.println(mbuy.getFb_number());
			System.out.println(mbuy.getFb_u_address());
			System.out.println(mbuy.getFb_new_address());
			
			
			if(ss.getMapper(MilkitMapper.class).regMilkitbuy(mbuy) == 1) { 
				System.out.println("등록 성공");
				req.setAttribute("r", "등록 성공!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "db서버문제..");
			
		}
		
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
