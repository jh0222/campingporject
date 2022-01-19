<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>  
<h3>상품수정</h3>
<form action="update.product" enctype="multipart/form-data" method="post">
    <table border="1">
        <tr>	
            <td>상품명</td> ${Product} 
            <td><input type="text" name="p_name" value="${p.p_name}"></td>
        </tr>
        <tr>
            <td>가격</td>
            <td><input type="text" name="p_price" value="${p.p_price }"></td>
        </tr>
        <tr>
            <td>상품설명</td>
            <td><textarea rows="10" cols="60" name="p_txt">${p.p_txt}</textarea></td>
        </tr>
        <tr>
            <td>상품이미지</td>
            <td><input type="file" name="p_picture"><td>
 		
        </tr> 
        <tr>
            <td colspan="2" align="center">
            	<button>수정</button>
            </td>
        </tr>
    </table>
    
    <table>
			<tr>
				<td><img src="resources/img/${p.p_picture }" width="200px;" height="100px;"></td>
			<tr>
		</table>
	
</form>
</body>
</html>