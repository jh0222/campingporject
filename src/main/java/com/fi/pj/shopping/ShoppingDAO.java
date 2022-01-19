package com.fi.pj.shopping;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


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

	public void delProduct(HttpServletRequest req, Product p) {
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

	public void getProduct(HttpServletRequest req, Product p) {
		
		ShoppingMapper mm = ss.getMapper(ShoppingMapper.class); 
			Product product = mm.detailProduct(p);  
			req.setAttribute("p", product );
		
		
	}
	public void updateProduct(HttpServletRequest req, Product p) {
		try { 
						
						String path = req.getSession().getServletContext().getRealPath("resources/img");
						System.out.println(path);
						MultipartRequest mr = null;
						String oldFile = p.getP_picture();
						String newFile = null;
					try {
						mr = new MultipartRequest(req, path, 31457280, "utf-8", new DefaultFileRenamePolicy());
						newFile = mr.getFilesystemName("p_picture");  //실제 업로드된 사진 가져옴
						if (newFile == null) { //사진 첨부하지 않으면
							newFile = oldFile; //기존 똑같은 파일명 넣어줌
						} else {
							newFile = URLEncoder.encode(newFile, "utf-8");
							newFile = newFile.replace("+", " ");
						}
					} catch (Exception e)	{
						e.printStackTrace();
						req.setAttribute("r", "수정실패");
						return;
					}
					
					/*-----------------------------------------------------------------*/
					try {
						String name = mr.getParameter("p_name");
						int price = Integer.parseInt(mr.getParameter("p_price"));
						String txt = mr.getParameter("p_txt");
	
						System.out.println(name);
						System.out.println(price);
						System.out.println(txt);
				
						p.setP_name(name); 
						p.setP_price(price);
						p.setP_txt(txt); 
						
						if(ss.getMapper(ShoppingMapper.class).updateProduct(p) == 1) { 
							System.out.println("수정 성공");
							req.setAttribute("r", "수정 성공!");
							if (!oldFile.equals(newFile)) { //oldFile과 newFile이 같지않으면
								oldFile = URLDecoder.decode(oldFile, "utf-8");
								new File(path + "/" + oldFile).delete(); //기존에 있던 oldfile 삭제
							}
						} else {
							req.setAttribute("result", "수정실패");
							if (!oldFile.equals(newFile)) { //oidFile과 newFile이 같지않으면
								newFile = URLDecoder.decode(newFile, "utf-8"); 
								new File(path + "/" + newFile).delete(); //기존에 있던 newFile 삭제
						}
					}
			  } catch (Exception e) {
				  e.printStackTrace();
				  req.setAttribute("r", "수정실패"); 
				  if (!oldFile.equals(newFile)) {//oidFile과 newFile이 같지않으면
					  try {
							newFile = URLDecoder.decode(newFile, "utf-8");
						} catch (UnsupportedEncodingException e1) {
						}
						new File(path + "/" + newFile).delete();   //기존에 있던 newFile 삭제
				  }
	
		
			  }
		}finally {
			
		}
	}
}
						
	
