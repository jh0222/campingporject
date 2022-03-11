package com.fi.pj.shopping;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fi.pj.member.BossMember;
import com.fi.pj.member.LoginMember;
import com.fi.pj.member.Root;
import com.fi.pj.member.UserMember;
import com.fi.pj.milkit.MilkitMapper;
import com.fi.pj.milkit.MilkitRank;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class ShoppingDAO {

	@Autowired
	private SqlSession ss;

//캠핑용품 목록
	public void getAllProduct(HttpServletRequest req) {
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

		List<Product> products = ss.getMapper(ShoppingMapper.class).getAllProduct(p);

		int total = ss.getMapper(ShoppingMapper.class).getAllProductcnt(); // 총 게시물 수
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
		req.setAttribute("products", products);

	}

// 캠핑용품 등록
	public void regProduct(Product p, HttpServletRequest req) {
		try {

			String path = req.getSession().getServletContext().getRealPath("resources/img");
			System.out.println(path);

			MultipartRequest mr = new MultipartRequest(req, path, 31457280, "utf-8", new DefaultFileRenamePolicy());

			String name = mr.getParameter("p_name");
			int price = Integer.parseInt(mr.getParameter("p_price"));
			String txt = mr.getParameter("p_txt");
			String picture = mr.getFilesystemName(("p_picture"));

			System.out.println(name);
			System.out.println(price);
			System.out.println(txt);
			System.out.println(picture);

			p.setP_name(name);
			p.setP_picture(picture);
			p.setP_price(price);
			p.setP_txt(txt);

			if (ss.getMapper(ShoppingMapper.class).regProduct(p) == 1) {
				System.out.println("등록 성공");
				req.setAttribute("r", "등록 성공!");
			} else {
				req.setAttribute("result", "등록실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "db서버문제..");

		}

	}

//캠핑용품 검색
	public void searchProduct(Product p, HttpServletRequest req) {

		req.setAttribute("products", ss.getMapper(ShoppingMapper.class).ProductSearch(p));

	}

	public void delProduct(Product p, HttpServletRequest req) {
		try {
			String path = req.getSession().getServletContext().getRealPath("resources/img");
			System.out.println(path);
			Product pp = ss.getMapper(ShoppingMapper.class).getProduct(p);
			System.out.println(pp.getP_picture());
			String fileName = pp.getP_picture();
			File f = new File(path + "/" + fileName);

			if (ss.getMapper(ShoppingMapper.class).delProduct(p) == 1 &&
					ss.getMapper(ShoppingMapper.class).delProduct_basket(p) == 1) {
				System.out.println("삭제 성공");
				f.delete();
				req.setAttribute("r", "삭제 성공!");
			}

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "db서버문제..");

		}

	}

	public void getProduct(Product p, HttpServletRequest req) {

		ShoppingMapper mm = ss.getMapper(ShoppingMapper.class);
		Product product = mm.getProduct(p);
		req.setAttribute("p", product);

	}

	public void updateProduct(Product p, HttpServletRequest req) {
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
			String name = mr.getParameter("p_name");
			int price = Integer.parseInt(mr.getParameter("p_price"));
			String txt = mr.getParameter("p_txt");
			String newpicture = mr.getFilesystemName("p_picture2");
			String oldpicture = mr.getParameter("p_picture");

			p.setP_name(name);
			p.setP_price(price);
			p.setP_txt(txt);
			if (newpicture != null) {
				p.setP_picture(newpicture);
			} else {
				p.setP_picture(oldpicture);
			}

			if (ss.getMapper(ShoppingMapper.class).updateProduct(p) == 1) {
				req.setAttribute("r", "수정 성공!");
			} else {
				req.setAttribute("result", "수정실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
			String fileName = mr.getFilesystemName("p_picture2");
			new File(path + "/" + fileName).delete();
			req.setAttribute("result", "수정실패");
		}

	}

	// 리뷰목록
	public void getAllProductReview(HttpServletRequest req) {
		
		String prno = req.getParameter("pr_p_no"); 
		req.setAttribute("productreviews", ss.getMapper(ShoppingMapper.class).getAllProductReview(prno));

	}

	// (구매계정)리뷰등록
	public void reviewwrite(Reviewinsert ri, Product p, HttpServletRequest req) {
		UserMember u_member = (UserMember) req.getSession().getAttribute("loginMember");
		BossMember b_member = (BossMember) req.getSession().getAttribute("loginMember2");
		Root r_member = (Root) req.getSession().getAttribute("loginMember3");

		if (u_member != null) {
			ri.setId(u_member.getU_id());
		}
		if (b_member != null) {
			ri.setId(b_member.getBo_id());
		}
		if (r_member != null) {
			ri.setId(r_member.getRoot_id());
		}
		System.out.println(ri.getId());
		// System.out.println(ri.getId());
		// System.out.println(ri.getId());

		if (ss.getMapper(ShoppingMapper.class).Productreview_id_select(ri) >= 1) {
			req.setAttribute("reviewPage", "../shopping/campingproduct_review.jsp");
		}
	}

	// 리뷰등록
	public void regProductreview(ProductReview pr, HttpServletRequest req) {
		if (ss.getMapper(ShoppingMapper.class).regProductreview(pr) == 1) {
			System.out.println("등록성공");
			req.setAttribute("r", "등록 성공");
		} else {
			req.setAttribute("r", "등록 실패..");
		}

	}

	public void delProductreview(ProductReview pr, HttpServletRequest req) {

		if (ss.getMapper(ShoppingMapper.class).delProductreview(pr) == 1) {
			System.out.println("삭제성공");
			req.setAttribute("r", "삭제 성공");
		} else {
			req.setAttribute("r", "삭제 실패..");
		}
	}

	public void updateProductreview(ProductReview pr, HttpServletRequest req) {
		
		if (ss.getMapper(ShoppingMapper.class).updateProductreview(pr) == 1) {
			System.out.println("리뷰수정 성공");
			req.setAttribute("r", "수정 성공");
		} else {
			req.setAttribute("r", "수정 실패..");
		}
		
	}

	public void regProductbasket(ProductBasket pb, HttpServletRequest req) {
		try {

			System.out.println(pb.getBa_p_no());
			System.out.println(pb.getBa_p_name());
			System.out.println(pb.getBa_p_picture());
			System.out.println(pb.getBa_number());
			System.out.println(pb.getBa_u_bo_id());
			System.out.println(pb.getBa_no());

			if (ss.getMapper(ShoppingMapper.class).regProductbasket(pb) == 1) {
				System.out.println("등록 성공");
				req.setAttribute("r", "등록 성공!");
			}

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "db서버문제..");

		}

	}

	public void regProductbuy(ProductBuy pbuy, HttpServletRequest req) {

		try {

			System.out.println(pbuy.getB_u_bo_id());
			System.out.println(pbuy.getB_p_no());
			System.out.println(pbuy.getB_p_name());
			System.out.println(pbuy.getB_price());
			System.out.println(pbuy.getB_number());
			System.out.println(pbuy.getB_u_address());
			System.out.println(pbuy.getB_new_address());

			if (ss.getMapper(ShoppingMapper.class).regProductbuy(pbuy) == 1) {
				System.out.println("등록 성공");
				req.setAttribute("r", "등록 성공!");
			}

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "db서버문제..");

		}
	}

	public void productrank(HttpServletRequest req) {
		
		List<ProductRank> productrank = ss.getMapper(ShoppingMapper.class).ProductRank();
		req.setAttribute("productrank", productrank);
		
	}
	
	public void milkitrank(HttpServletRequest req) {
		
		List<MilkitRank> milkitrank = ss.getMapper(MilkitMapper.class).MilkitRank();
		req.setAttribute("milkitrank", milkitrank);
		
	}

}
