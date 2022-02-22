<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="cart/Cart.css">
<script src="/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<h1>캠핑용품</h1>
<ul>
<li>
  <div class="allCheck">
   <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label> 
  </div>
  
  <script>
	$("#allCheck").click(function(){
 		var chk = $("#allCheck").prop("checked");
 			if(chk) {
  			$(".chBox").prop("checked", true);
 			} else {
  			$(".chBox").prop("checked", false);
 		}
	});
   </script>
  <div class="delBtn">
   <button type="button" class="selectDelete_btn">선택 삭제</button> 
   <script>
   	$(".selectDelete_btn").click(function(){
	   var confirm_val = confirm("정말 삭제하시겠습니까?");
	   
	   if(confirm_val) {
	    var checkArr = new Array();
	    
	    $("input[class='chBox']:checked").each(function(){
	     checkArr.push($(this).attr("data-cartNum"));
	    });
	     
	    $.ajax({
	     url : "/pj/UserdeleteCart", // 전송 페이지
	     type : "post",          
	     data : { chbox : checkArr }, // 전송할 데이터
	     success : function(){
	      location.href = "/pj/UserCart"; // 전송에 성공하면 실행될 코드
	     }
	    });
   </script>
  </div>
 </li>
 <c:choose>
 <c:when test="${bo_no.count == 0}">
 	장바구니가 비어있습니다.
 </c:when>
 <c:otherwise>
 <c:forEach items="${Ccartlist}" var="c">
 <li>
  <div class="checkBox">
   <input type="checkbox" name="chBox" class="chBox" data-cartNum="${c.ba_no}" />
  
   <script>
 	$(".chBox").click(function(){
  		$("#allCheck").prop("checked", false);
 	});
   </script>
  </div>
 
  <div class="thumb">
   <img src="${c.ba_p_picture}" />
  </div>
  <div class="gdsInfo">
   <p>
    <span>상품명</span>${c.ba_p_name}<br/>
    <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${c.ba_price}" /> 원<br/>
    <span>구입 수량</span>${c.ba_number} 개<br/>
    <span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${c.ba_price * c.ba_number}"/> 원
   </p>
   
   <div class="delete">
    <button type="button" class="delete_btn" data-cartNum="${c.ba_no}">삭제</button>
   </div>
  </div>   
 </li>
 
 </c:forEach>
 </c:otherwise>
 </c:choose>
</ul>

<hr>
<h1>밀키트</h1>
<ul>
 <li>
  <div class="allCheck">
   <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>  
  </div>
  
  <div class="delBtn">
   <button type="button" class="selectDelete_btn">선택 삭제</button> 
  </div>
 </li>
 <c:choose>
 <c:when test="${fbo_no.count == 0}">
 	장바구니가 비어있습니다.
 </c:when>
 <c:otherwise>
 <c:forEach items="${Mcartlist}" var="c">
 
 <li>
  <div class="checkBox">
   <input type="checkbox" name="chBox" class="chBox" data-cartNum="${c.fba_no}" />
  </div>
 
  <div class="thumb">
   <img src="${c.fba_fp_picture}" />
  </div>
  <div class="gdsInfo">
   <p>
    <span>상품명</span>${c.fba_fp_name}<br/>
    <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${c.fba_price}" /> 원<br/>
    <span>구입 수량</span>${c.fba_number} 개<br/>
    <span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${c.fba_price * c.fba_number}"/> 원
   </p>
   
   <div class="delete">
    <button type="button" class="delete_btn" data-cartNum="${c.fba_no}">삭제</button>
   </div>
  </div>   
 </li>
 
 </c:forEach>
 </c:otherwise>
 </c:choose>
 
</ul>
</body>
</html>