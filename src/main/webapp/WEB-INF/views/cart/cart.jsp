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
</head>
<body>
<div class="content_area">
	<div class="content_subject"><span><a >캠핑용품</span>	</div>
	<!-- 장바구니 리스트 -->
	<div class="content_middle_section"></div>
	<!-- 장바구니 가격 합계 -->
	<!-- cartInfo -->
	<div class="content_totalCount_section">
		<!-- 체크박스 전체 여부 -->
		<div class="all_check_input_div">
			<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span">전체선택</span>
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
				<c:forEach items="${campingproduct}" var="c">
					<tr>
						<td class="td_width_1 cart_info_td">
							<input type="checkbox" class="individual_cart_checkbox input_size_20" checked="checked">
							<input type="hidden" class="individual_bookPrice_input" value="${c.ba_price}">
							<input type="hidden" class="individual_bookCount_input" value="${c.ba_number}">
							<input type="hidden" class="individual_totalPrice_input" value="${c.ba_price * c.ba_number}">
						</td>
						<td class="td_width_2"><img src="resources/img/${c.ba_p_picture }" width="100" height="100"></td>
						<td class="td_width_3">${c.ba_p_name}</td>
						<td class="td_width_4 price_td">
							판매가 : <fmt:formatNumber	value="${c.ba_price}" pattern="#,### 원" />
						</td>
						<td class="td_width_4 table_text_align_center">
							<div class="table_text_align_center quantity_div">
								<input type="text" value="${c.ba_number}" class="quantity_input">
								<button class="quantity_btn plus_btn">+</button>
								<button class="quantity_btn minus_btn">-</button>
							</div>
								<a class="quantity_modify_btn" data-cartId="${c.ba_no}" >변경</a>
						</td>
						<td class="td_width_4 table_text_align_center">
							<fmt:formatNumber value="${c.ba_price * c.ba_number}" pattern="#,### 원" /></td>
						<td class="td_width_4 table_text_align_center delete_btn">
							<button class="delete_btn" data-cartid="${c.ba_no}">삭제</button>
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
							<tr>
								<td>총 상품 가격</td>
								<td><span class="totalPrice_span">${c.ba_price * c.ba_number}</span> 원</td>
							</tr>
							<tr>
								<td>총 주문 상품수</td>
								<td><span class="totalCount_span">${c.ba_number}</span>개</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<div class="boundary_div">구분선</div>
			<table>
				<tr>
					<td>
						<table>
							<tbody>
								<tr>
									<td><strong>총 결제 예상 금액</strong></td>
									<td><span class="finalTotalPrice_span">${c.ba_price * c.ba_number}</span> 원</td>
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
	<form action="cart.update" method="post" class="quantity_update_form">
		<input type="hidden" name="cartId" class="update_cartId">
		<input type="hidden" name="bookCount" class="update_bookCount">
		<input type="hidden" name="memberId" value="'${c.ba_u_bo_id}'">
	</form>
	
	<!-- 삭제 form -->
	<form action="cart.delete" method="post" class="quantity_delete_form">
		<input type="hidden" name="cartId" class="delete_cartId">
		<input type="hidden" name="memberId" value="${c.ba_u_bo_id}">
	</form>
	
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
		$(".delete_btn").on("click", function(e){
			e.preventDefault();
			const cartId = $(this).data("cartid");
			$(".delete_cartId").val(cartId);
			$(".quantity_delete_form").submit();
		});
		
	</script>
</body>
</html>