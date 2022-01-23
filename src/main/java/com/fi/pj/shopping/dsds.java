/*package com.fi.pj.shopping;

public class dsds {
	public void fbupdate(Freeboard fb, HttpServletRequest req) {
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
            String f_subject = mr.getParameter("subject");
            String f_txt = mr.getParameter("txt");
            String newpicture = mr.getFilesystemName("picture");
            System.out.println(newpicture);
//            newpicture = URLEncoder.encode(newpicture, "utf-8");
//            newpicture = newpicture.replace("+", " ");
            String oldpicture = mr.getParameter("f_picture");

            fb.setF_subject(f_subject);
            fb.setF_txt(f_txt);
            if(newpicture != null) {
                fb.setF_picture(newpicture);
            } else {
                fb.setF_picture(oldpicture);
            }

            if (ss.getMapper(BoardMapper.class).FbUpdate(fb) == 1) {
                req.setAttribute("result", "수정성공");
            } else {
                req.setAttribute("result", "수정실패");
            }

        } catch (Exception e) {
            e.printStackTrace();
            String fileName = mr.getFilesystemName("picture");
            new File(path + "/" + fileName).delete();
            req.setAttribute("result", "수정실패");
        }

    }
}
*/