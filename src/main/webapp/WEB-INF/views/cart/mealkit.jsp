<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/cart.css">
<style>
* {
  box-sizing: border-box;
}

.row {
  margin-right: 150px;
  margin-left: 150px;
}

/* Style the header */
.header {
  background-color: #f1f1f1;
  padding: 5px;
  text-align: center;
}

/* Style the top navigation bar */
.topnav {
  overflow: hidden;
  background-color: #333;
}

/* Style the topnav links */
.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.column {
  float: left;
  padding: 10px;
}

.column.side {
  width: 25%;
}

.column.middle {
  width: 75%;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}

@media screen and (max-width: 600px) {
  .column.side, .column.middle {
    width: 100%;
  }
}

.footer {
  background-color: #f1f1f1;
  padding: 10px;
  text-align: center;
}

table, td, th {
    border-collapse : collapse;
    border-bottom: 1px solid black;
    padding : 10px;
}

.td1 {
	text-align: center;
}

.hidden {
	display: none;
}
</style>

</head>
<body>

  <div class="topnav">
  	<a href = "cart">캠핑용품</a>
  	<a href = "mealkit">밀키트</a>
  </div>
  <div class="column middle">
  
<div class="content_area">
	<!-- 장바구니 리스트 -->
	<div class="content_middle_section"></div>
	<!-- 장바구니 가격 합계 -->
	<!-- cartInfo -->
	<div class="content_totalCount_section">
		<!-- 체크박스 전체 여부 -->
		<div class="all_check_input_div">
			<input name="allCheck" type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span">전체선택</span>
			<input type="button" value="선택삭제" class="btn btn-outline-info" onclick="deleteValue();">
		</div>
		<table class="subject_table">
			<caption>표 제목 부분</caption>
			<tbody>
				<tr>
					<th class="td_width_1"></th>
					<th class="td_width_2"></th>
					<th class="td_width_3">상품명</th>
					<th class="td_width_4">가격</th>
					<th class="td_width_4">수량</th>
					<th class="td_width_4">합계</th>
					<th class="td_width_4">삭제</th>
				</tr>
			</tbody>
		</table>
		<table class="cart_table">
			<caption>표 내용 부분</caption>
			<tbody>
				<c:forEach items="${mealkit}" var="c">
					<tr>
						<td class="td_width_1 cart_info_td">
							<input name="RowCheck" type="checkbox" class="individual_cart_checkbox input_size_20" checked="checked" value="${c.fba_no}">
							<input type="hidden" class="individual_bookPrice_input" value="${c.fba_price}">
							<input type="hidden" class="individual_bookCount_input" value="${c.fba_number}">
							<input type="hidden" class="individual_totalPrice_input" value="${c.fba_price * c.fba_number}">
						</td>
						<td class="td_width_2"><img src="resources/img/${c.fba_fp_picture }" width="100" height="100"></td>
						<td class="td_width_3">${c.fba_fp_name}</td>
						<td class="td_width_4 price_td">
							판매가 : <fmt:formatNumber	value="${c.fba_price}" pattern="#,### 원" />
						</td>
						<td class="td_width_4 table_text_align_center">
							<div class="table_text_align_center quantity_div">
								<input type="text" value="${c.fba_number}" class="quantity_input">
								<button class="quantity_btn plus_btn">+</button>
								<button class="quantity_btn minus_btn">-</button>
							</div>
								<button class="quantity_modify_btn" data-cartId="${c.fba_no}">변경</button>
						</td>
						<td class="td_width_4 table_text_align_center">
							<fmt:formatNumber value="${c.fba_price * c.fba_number}" pattern="#,### 원" /></td>
						<td class="td_width_4 table_text_align_center delete_btn">
							<button class="delete_btn2" type="button" value="${c.fba_no}">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<table class="list_table">
		</table>
	</div>
	<!-- 가격 종합 -->
	<div class="content_total_section">
		<div class="total_wrap">			
			<table>
				<tr>
					<td>
						<table>
							<tbody>
								<tr>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</td>
					<td>
						<table>
							<tbody>
								<tr>
									<td>총 상품 가격</td>
									<td><span class="totalPrice_span">${c.fba_price * c.fba_number}</span>원</td>
								</tr>
								<tr>
									<td>총 주문 상품수</td>
									<td><span class="totalCount_span">${c.fba_number}</span>개</td>
								</tr>	
								<tr>
									<td>
										<strong>총 결제 예상 금액</strong>				
									</td>
									<td>
										<span class="finalTotalPrice_span">${c.fba_price * c.fba_number}</span> 원
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<!-- 구매 버튼 영역 -->
	<div class="content_btn_section">
		<a>주문하기</a>
	</div>
	
	<!-- 수량 조정 form -->
	<form action="mealkit.update" method="post" class="quantity_update_form">
		<input type="hidden" name="fba_no" class="update_cartId">
		<input type="hidden" name="fba_number" class="update_bookCount">
		<input type="hidden" name="fba_u_bo_id" value="'${c.fba_u_bo_id}'">
	</form>
	
	<!-- 삭제 form -->
	<form action="mealkit.delete" method="get" class="quantity_delete_form">
		<input type="hidden" name="fba_no" class="delete_cartId" >
		<input type="hidden" name="fba_u_bo_id" value="'${c.fba_u_bo_id}'">
	</form>
	
</div>	
</div>
<script type="text/javascript">
		$(document).ready(function(){
			setTotalInfo();
		});
		
		/* 체크여부에따른 종합 정보 변화 */
		$(".individual_cart_checkbox").on("change", function(){
			/* 총 주문 정보 세팅(총 가격, 물품 수) */
			setTotalInfo($(".cart_info_td"));
		});
		
		/* 체크박스 전체 선택 */
		$(".all_check_input").on("click", function(){

			/* 체크박스 체크/해제 */
			if($(".all_check_input").prop("checked")){
				$(".individual_cart_checkbox").attr("checked", true);
			} else{
				$(".individual_cart_checkbox").attr("checked", false);
			}
			
			/* 총 주문 정보 세팅(총 가격, 물품 수) */
			setTotalInfo($(".cart_info_td"));
			
		});
		
		/* 총 주문 정보 세팅(총 가격, 물품 수) */
		function setTotalInfo(){
			let totalCount = 0;				// 총 갯수
			let totalPrice = 0;				// 총 가격
			let finalTotalPrice = 0; 		// 최종 가격(총 가격)	
			
			$(".cart_info_td").each(function(index, element){
				if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부	
					// 총 가격
					totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
					// 총 갯수
					totalCount += parseInt($(element).find(".individual_bookCount_input").val());
				}
			});
			
			/* 최종 가격 */
			finalTotalPrice = totalPrice;
			
			/* 값 삽입 */
			// 총 가격
			$(".totalPrice_span").text(totalPrice.toLocaleString());
			// 총 갯수
			$(".totalCount_span").text(totalCount);	
			// 최종 가격(총 가격 + 배송비)
			$(".finalTotalPrice_span").text(totalPrice.toLocaleString());
		}
		
		/* 수량버튼 */
		$(".plus_btn").on("click", function(){
			let quantity = $(this).parent("div").find("input").val();
			$(this).parent("div").find("input").val(++quantity);
		});
		$(".minus_btn").on("click", function(){
			let quantity = $(this).parent("div").find("input").val();
			if(quantity > 1){
				$(this).parent("div").find("input").val(--quantity);		
			}
		});
		
		/* 수량 수정 버튼 */
		$(".quantity_modify_btn").on("click", function(){
			let cartId = $(this).data("cartid");
			let bookCount = $(this).parent("td").find("input").val();
			$(".update_cartId").val(cartId);
			$(".update_bookCount").val(bookCount);
			$(".quantity_update_form").submit();
			
		});
		
		/* 장바구니 삭제 버튼 */
		$(".delete_btn2").on("click", function(e){
			let cartId2 = $(this).val();
			cartId2 = parseInt(cartId2);
			$(".delete_cartId").val(cartId2);
			$(".quantity_delete_form").submit();
		});
		
</script>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script>		
		/* 장바구니 삭제 버튼 */ 
		$(function(){
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;
			
			 $("input[name='allCheck']").click(function(){
				var chk_listArr = $("input[name='RowCheck']");
				for (var i=0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function(){
				if($("input[name='RowCheck']:checked").length == rowCnt){
					$("input[name='allCheck']")[0].checked = true;
				}
				else{
					$("input[name='allCheck']")[0].checked = false;
				}
			}); 
		});  
		
		 function deleteValue(){
			var url = "mealkits.delete";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
			var valueArr = new Array();
		    var list = $("input[name='RowCheck']");
		    for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
		            valueArr.push(list[i].value);
		        }
		    }
		    /*
		    location.href='delete?valueArr='+valueArr;
		    
		    };*/
		 
		    if (valueArr.length == 0){
		    	alert("선택된 품목이 없습니다.");
		    }
		    else{
				var chk = confirm("정말 삭제하시겠습니까?");
				if(chk == true){
				$.ajax({
				    url : "mealkits.delete",                    // 전송 URL
				    type : 'GET',                // GET or POST 방식
				    traditional : true,
				    data : {
				    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
				    },
	                success: function(data){
	                	console.log(data);
	                    if(data = 1) {
	                        alert("삭제되었습니다.");
	                        location.replace("mealkit")
	                    }
	                    else{
	                        alert("삭제되지않았습니다.");
	                    }
	                }
				});
			}
			else{
				location.replace("mealkit")
			}
		}
	}
</script>
</body>
</html>