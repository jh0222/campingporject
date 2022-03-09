<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트 등록</title>
</head>
<body>
<div class="reglayout">
<h3 class="regh3" style="font-size: 30px;"><i class="fa-solid fa-utensils"></i>&nbsp;<b>밀키트등록</b></h3>
<form action="reg.milkit" enctype="multipart/form-data" method="post">
    <table border="1" class="pr_regtb ">
        <tr class="active">
            <td class="pr_regtd" style="font-size: 20px;">밀키트 명</td>
            <td><input type="text" name="fp_name" class="pr_reginput"></td>
        </tr>
        <tr>
            <td class="pr_regtd" style="font-size: 20px;">가격</td>
            <td><input type="text" name="fp_price" class="pr_reginput"></td>
        </tr>
        <tr>
            <td class="pr_regtd" style="font-size: 20px;">상품설명</td>
            <td><textarea name="fp_txt" placeholder="내용을 입력해 주세요." class="pr_regcontent"></textarea></td>
        </tr>
        <tr >
            <td class="pr_regtd" style="font-size: 20px;">밀키트 이미지</td>
            <td><input type="file" name="fp_picture"><td>
        </tr>
    </table>
    <button class="pr_regbtn">등록</button>
</form>
</div>
</body>
</html>