<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table> 
<!--  
		<tr>
			<td>번호</td>
			<td>${p.p_no }</td>  
			${Product } 
			
		</tr>
		<tr>
			<td>상품명</td>
			<td>${p.p_name }</td>  
		</tr>
		<tr>
			<td>상품가격</td>
			<td>${p.p_price }</td>
		</tr>
		<tr>
			<td>설명</td>
			<td>${p.p_txt }</td>
		</tr>
	</table>
	-->
	
	
	 <h2>상품 상세정보</h2>
    <table border="1">
        <tr>
            <td>
                <img src="resources/img/${p.p_picture }" width="340" height="300">
            </td>
            <td>
                <table border="1" style="height: 300px; width: 400px;">
                    <tr align="center">
                        <td>상품명</td>
                        <td>${p.p_name }</td>
                    </tr>
                    <tr align="center">
                        <td>가격</td>
                        <td><fmt:formatNumber value="${p.p_price }" pattern="###,###,###"/></td>
                    </tr>
                    <tr align="center">
                        <td>상품소개</td>
                        <td>${p.p_txt }</td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <form name="form1" method="post" action="">
                                <input type="hidden" name="productno" value="${p.p_no }">
                                <select name="amount">
                                    <c:forEach begin="1" end="10" var="i">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                                </select>&nbsp;개
                                <button>장바구니 담기</button>
                            </form>
                             <button>구매하기</button><br>
                             <a href="camping.product">상품목록</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
	
</body>
</html>