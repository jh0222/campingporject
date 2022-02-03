package com.fi.pj.shopping;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fi.pj.member.LoginMember;
import com.fi.pj.member.UserMember;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@Service
public class ShoppingDAO {
	
	@Autowired
	private  SqlSession ss;

	public void getAllProduct(HttpServletRequest req) {
																			
		req.setAttribute("products",ss.getMapper(ShoppingMapper.class).getAllProduct());
		
	}

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
						
						if(ss.getMapper(ShoppingMapper.class).regProduct(p) == 1) { 
							System.out.println("등록 성공");
							req.setAttribute("r", "등록 성공!");
						}
						
					} catch (Exception e) {
						e.printStackTrace();
						req.setAttribute("r", "db서버문제..");
						
					}
					
		
	}

	public void searchProduct(Product p, HttpServletRequest req) {
		
		req.setAttribute("products",ss.getMapper(ShoppingMapper.class).ProductSearch(p)); 
		
	}

	public void delProduct(Product p, HttpServletRequest req) {
		try { 
			String path = req.getSession().getServletContext().getRealPath("resources/img");
			System.out.println(path);
			Product pp = ss.getMapper(ShoppingMapper.class).getProduct(p); 
			System.out.println(pp.getP_picture()); 
			String fileName = pp.getP_picture();
			File f = new File(path + "/" + fileName);
			
			if(ss.getMapper(ShoppingMapper.class).delProduct(p) == 1) { 
				System.out.println("삭제 성공");
				f.delete(); 
				req.setAttribute("r", "삭제 성공!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "db서버문제..");
			
		}
		
	}

	public void getProduct( Product p, HttpServletRequest req) {
		
		ShoppingMapper mm = ss.getMapper(ShoppingMapper.class); 
			Product product = mm.getProduct(p);  
			req.setAttribute("p", product );
		
		
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
			if(newpicture != null) {
                p.setP_picture(newpicture);
            } else {
            	p.setP_picture(oldpicture);
            }
			
			if(ss.getMapper(ShoppingMapper.class).updateProduct(p) == 1) { 				
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
	
	
	//리뷰목록
	public void getAllProductReview(HttpServletRequest req) {
		
		req.setAttribute("productreviews",ss.getMapper(ShoppingMapper.class).getAllProductReview());
		
		
	}

	//(구매계정)리뷰등록
	public void reviewwrite(Reviewinsert ri, Product p, HttpServletRequest req) {
		UserMember member =  (UserMember) req.getSession().getAttribute("loginMember");
		ri.setId(member.getU_id());
		System.out.println(ri.getId());
		if(ss.getMapper(ShoppingMapper.class).Productreview_id_select(ri) >= 1) {
			req.setAttribute("reviewPage", "../shopping/campingproduct_review.jsp");
		}
	}

	public void regProductreview(ProductReview pr, HttpServletRequest req) {
		System.out.println(pr.getPr_u_id() + "리뷰등록(id출력)");
		System.out.println(pr.getPr_date() + "리뷰등록시간");
		if(ss.getMapper(ShoppingMapper.class).regProductreview(pr) == 1) { 
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
	

		/*	    if(ss.getMapper(ShoppingMapper.class).Productreview_id_select2(pr) >= 1) {
		if (ss.getMapper(ShoppingMapper.class).updateProductreview(pr) == 1) {  
			System.out.println("리뷰수정 성공");
			req.setAttribute("r", "수정 성공");
		} else {
			req.setAttribute("r", "수정 실패..");
		}
	    }	
	}
*/

	public void regProductbasket(ProductBasket pb, HttpServletRequest req) {
		try { 
					
			System.out.println(pb.getBa_p_no());
			System.out.println(pb.getBa_p_name());
			System.out.println(pb.getBa_p_picture());
			System.out.println(pb.getBa_number());
			System.out.println(pb.getBa_u_bo_id());
			System.out.println(pb.getBa_no());
			
			
			if(ss.getMapper(ShoppingMapper.class).regProductbasket(pb) == 1) { 
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
			
			
			if(ss.getMapper(ShoppingMapper.class).regProductbuy(pbuy) == 1) { 
				System.out.println("등록 성공");
				req.setAttribute("r", "등록 성공!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "db서버문제..");
			
		}
	}
		
	}
		
	

						
	
