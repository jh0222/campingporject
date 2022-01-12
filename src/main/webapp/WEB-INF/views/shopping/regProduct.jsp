<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>상품 등록</h2>
<form action="reg.product" enctype="multipart/form-data" method="post">
    <table border="1">
        <tr>
            <td>상품명</td>
            <td><input type="text" name="productName"></td>
        </tr>
        <tr>
            <td>가격</td>
            <td><input type="text" name="productPrice"></td>
        </tr>
        <tr>
            <td>상품설명</td>
            <td><textarea rows="10" cols="60" name="producttxt"></textarea></td>
        </tr>
        <tr>
            <td>상품이미지</td>
            <td><input type="file" name="productPhoto"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
            	<button>등록</button>
            	<button>목록</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>