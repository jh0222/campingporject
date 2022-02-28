<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

function delreview(no) {
	let d = confirm('리뷰를 삭제하시겠습니까?');			
	if(d) {
		location.href = "del.productreview?pr_no=" + no + "&p_no=" + ${p.p_no} + "&pr_p_no=" + ${p.p_no}  ;
	}
}

function updatereview(no,t) {
	let txt = prompt("수정할 내용을 적어주세요",t);
	if(txt != ""){
		location.href = "update.productreview?pr_no=" + no + "&pr_txt=" + txt + "&p_no=" + ${p.p_no} + "&pr_p_no=" + ${p.p_no};
	}
}
  
//수량+합계
var sell_price;
var amount;

function init () {
	sell_price = document.form.sell_price.value;
	amount = document.form.amount.value;
	document.form.sum.value = sell_price;
	change();
}

function plus () {
	hm = document.form.amount;
	sum = document.form.sum;
	hm.value ++ ;

	sum.value = parseInt(hm.value) * sell_price;
}

function minus () {
	hm = document.form.amount;
	sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
}

function change () {
	hm = document.form.amount;
	sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * sell_price;
}  

//주문하기 + 장바구니

  function mySubmit(index) {
    if (index == 1) {
      document.form.method = 'GET'
      document.form.action='orderproduct.go?p_no=${p.p_no}&p_name=${p.p_name}&p_price=${p.p_price }&p_picture=${p.p_picture }&id=${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }';
      document.form.submit();
    }
    if (index == 2) {
       if(confirm("상품을 장바구니에 추가하시겠습니까?")) {	
    	let price = document.getElementById('sum').value; //id값   
    	let amount = document.form.amount.value; //name값
    	
    	
    	document.form.method = 'POST'
    	document.form.action='reg.productbasket?ba_p_no=${p.p_no}&ba_p_name=${p.p_name}&ba_price='+price+'&ba_p_picture=${p.p_picture }&ba_u_bo_id=${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }&ba_number='+amount;
    	document.form.submit();
       } else {
    	//document.form.reset();
    	window.location.reload();
    }
    }
	  
  }

</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="init();">

	<table width="100%" >
		<hr>
		<h2 class="detail_h2">상품 상세정보</h2> 
		<hr><br>
		<td>
			<table class="detail_picture_table">
				<tr>
					<td><img src="resources/img/${p.p_picture }" class="detail_img"></td>
				<tr>
			</table>
		</td>
		
		<td>
		<div class="deatil_div0">
		<div class="detail_div1" align="center">${p.p_name }</div><br><br>
		<div class="detail_div2"><b>상품가격&nbsp;&nbsp;</b>  ${p.p_price }원</div><hr><br>
		<div class="detail_div2"><b>배송비&nbsp;&nbsp;&nbsp;&nbsp; </b> 무료</div><hr><br>
		<div class="detail_div3"><b>상품소개&nbsp;&nbsp;</b></div><div class="detail_div2" style="width: 500px;">${p.p_txt }</div><hr><br>
		</div>

					  <form name="form" method="GET" enctype="multipart/form-data"> 
					<table border="0" style="border-collapse: collapse";>
					<tr>
					<td align="center"> 
						<table border="0" style="border-collapse: collapse";>
						<tr>
							<td class="detail_p_name2">
									 <input type=hidden name="sell_price" value="${p.p_price }" class="detail_price"><div class="detail_price">${p.p_price }&nbsp;&nbsp;원</div>
							수량&nbsp;&nbsp;	 <input type="text" name="amount" value="1" size="1" onchange="change();">
								 	 <input type="button" value=" + " class="plus_btn" onclick="plus();"><input type="button" value=" - " class="plus_btn2" onclick="minus();"><br>
								총 결제 금액<input type="text" name="sum" id="sum" size="6" readonly style="border:none" class="detail_sum"><span class=detail_won>원</span>
									 <input type="hidden" name="p_no" value="${p.p_no}">
									 <input type="hidden" name="p_name" value="${p.p_name}">
									 <input type="hidden" name="p_price" value="${p.p_price }">
									 <input type="hidden" name="p_picture" value="${p.p_picture }">
									 <input type="hidden" name="u_id" value="${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }">
									 
							</td>
						</tr>
						
						<tr>
					<td colspan="2" align="center">
					<br>
 					 <input type="button" value="장바구니" class="detail_basket" onclick='mySubmit(2)' />
					<input type="button" value="구매하기" class="detail_order" onclick='mySubmit(1)' />
					</td>
						</tr>
						</table>
					</td>
					</tr>
					</table>
					</td>
					</table>
					</form>
					<button
							onClick="location.href='updateproduct.go?p_no=${p.p_no}&p_name=${p.p_name}&p_picture=${p.p_picture }&p_price=${p.p_price }&p_txt=${p.p_txt }&pr_p_no=${p.p_no}'">수정하기</button>
			<hr size="3">
			<h2 class="detail_h2">상품리뷰</h2>
			<hr><br>
			
			<jsp:include page="${reviewPage }"></jsp:include>
			<table border="0" class="detail_reviewtb" >
				<tr>
					<th>No</th>
					<th>Id</th>
					<th>Content</th>	
					<th>Date</th>	
				</tr>
					<c:forEach var="p" items="${productreviews }">
				<tr>
					<td>${p.pr_no }</td>
					<td>${p.pr_u_bo_id }</td>
					<td >${p.pr_txt }</td>
				<td><fmt:formatDate value="${p.pr_date }" dateStyle="short"/></td>
					<c:if test="${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id == p.pr_u_bo_id }">
					<td onclick="updatereview('${p.pr_no}','${p.pr_txt }')">수정</td>
					<td onclick="delreview(${p.pr_no})">삭제</td>
				</c:if>
				</tr>
				<tr>
				<td><hr></td><td><hr></td><td><hr></td><td><hr></td><td><hr></td><td><hr></td>
				</tr>
					</c:forEach>
			</table>			
						
</body>
</html>