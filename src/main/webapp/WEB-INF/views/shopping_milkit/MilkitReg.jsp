<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트 등록</title>
</head>
<body>
<h3>밀키트등록</h3>
<form action="reg.milkit" enctype="multipart/form-data" method="post">
    <table border="1">
        <tr>
            <td>상품명</td>
            <td><input type="text" name="fp_name"></td>
        </tr>
        <tr>
            <td>가격</td>
            <td><input type="text" name="fp_price"></td>
        </tr>
        <tr>
            <td>상품설명</td>
            <td><textarea rows="10" cols="60" name="fp_txt"></textarea></td>
        </tr>
        <tr>
            <td>상품이미지</td>
            <td><input type="file" name="fp_picture"><td>
        </tr>
        <tr>
            <td colspan="2" align="center">
            	<button>등록</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>