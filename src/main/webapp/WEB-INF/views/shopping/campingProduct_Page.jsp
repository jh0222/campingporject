<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑용품</title>
</head>
<body>
<h3>캠핑용품페이지</h3>
<button onClick="location.href='create.product'">상품등록</button>

<h3>상품목록</h3>
    <table border="1">
        <tr>
            <th>상품ID</th>
            <th>사진</th>
            <th>상품명</th>
            <th>가격</th>
        </tr>
        
        <c:forEach var="p" items="${list}">
        <tr>
            <td>
                ${p.productId} <!-- 상품ID -->
            </td>
            <td>
                <a href="${path}/shopping/productdetail/${p.productId}">
                    <img src="${path}/images/${p.productUrl}" width="120ox" height="110px">
                </a>
            </td>
            <td>
                <a href="${path}/shop/product/detail/${p.productId}">${p.productName}</a>
            </td>
            <td>
                <fmt:formatNumber value="${p.productPrice}" pattern="###,###,###"/>
            </td>
        </tr>
        </c:forEach>
    </table>

</body>
</html>