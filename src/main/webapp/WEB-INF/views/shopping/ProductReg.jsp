<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고캠핑 상품등록</title>
</head>
<body>
<body>
<h3 class="regh3" style="font-size: 30px;"><b>상품등록</b></h3>
<form action="reg.product" enctype="multipart/form-data" method="post">
    <table border="1" class="pr_regtb ">
        <tr class="active">
            <td class="pr_regtd" style="font-size: 20px;">상품명</td>
            <td><input type="text" name="p_name"></td>
        </tr>
        <tr>
            <td class="pr_regtd" style="font-size: 20px;">가격</td>
            <td><input type="text" name="p_price"></td>
        </tr>
        <tr>
            <td class="pr_regtd" style="font-size: 20px;">상품설명</td>
            <td><textarea name="p_txt" placeholder="내용을 입력해 주세요." class="pr_regcontent"></textarea></td>
        </tr>
        <tr >
            <td class="pr_regtd" style="font-size: 20px;">상품이미지</td>
            <td><input type="file" name="p_picture"><td>
        </tr>
    </table>
    <button class="pr_regbtn">등록</button>
</form>
</body>
</html>