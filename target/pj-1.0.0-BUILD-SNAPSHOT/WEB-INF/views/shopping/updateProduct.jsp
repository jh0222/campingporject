<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>  
<h3 class="regh3" style="font-size: 30px;"><b>캠핑용품 상품수정</b></h3>
<form action="update.product?p_no=${p.p_no }&pr_p_no=${p.p_no}" enctype="multipart/form-data" method="post">
    <table border="1" class="pr_regtb ">
        <tr>	
            <td class="pr_regtd" style="font-size: 20px;">상품명</td>
            <td><input type="text" name="p_name" value="${p.p_name}" style="border: none; width: 100%"></td>
        </tr>
        <tr>
            <td class="pr_regtd" style="font-size: 20px;">가격</td>
            <td><input type="text" name="p_price" value="${p.p_price }" style="border: none; width: 100%"></td>
        </tr>
        <tr>
            <td class="pr_regtd" style="font-size: 20px;">상품설명</td>
            <td><textarea name="p_txt" class="pr_regcontent">${p.p_txt}</textarea></td>
        </tr>
        <tr>
            <td class="pr_regtd" style="font-size: 20px;">상품이미지</td>
            <td><img src="resources/img/${p.p_picture }" width="300" height="300" name="p_picture">
            	<input name= "p_picture" type="hidden" value= "${p.p_picture}">
            	<input type="file" name= "p_picture2">
            <td>
 				
        </tr> 
    </table>
	<button class="pr_regbtn">수정</button>    

	
</form>
</body>
</html>