<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 class="regh3" style="font-size: 30px;"><b>밀키트 상품수정</b></h3>
<form action="update.milkit?fp_no=${fp.fp_no }&fpr_fp_no=${fp.fp_no}" enctype="multipart/form-data" method="post">
    <table border="1" class="pr_regtb ">
        <tr>	
            <td class="pr_regtd" style="font-size: 20px;">상품명</td>
            <td><input type="text" name="fp_name" value="${fp.fp_name}" style="border: none; width: 100%"></td>
        </tr>
        <tr>
            <td class="pr_regtd" style="font-size: 20px;">가격</td>
            <td><input type="text" name="fp_price" value="${fp.fp_price }" style="border: none; width: 100%"></td>
        </tr>
        <tr>
            <td class="pr_regtd" style="font-size: 20px;">상품설명</td>
            <td><textarea name="fp_txt" class="pr_regcontent">${fp.fp_txt}</textarea></td>
        </tr>
        <tr>
            <td class="pr_regtd" style="font-size: 20px;">상품이미지</td>
            <td><img src="resources/img/${fp.fp_picture }" width="300" height="300" name="fp_picture">
            	<input name= "fp_picture" type="hidden" value= "${fp.fp_picture}">
            	<input type="file" name= "fp_picture2">
            <td>
 				
        </tr> 
    </table>
	<button class="pr_regbtn">수정</button>    

	
</form>
</body>
</html>