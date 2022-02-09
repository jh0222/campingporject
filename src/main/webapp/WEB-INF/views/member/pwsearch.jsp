<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	/////////모///달///기///능///////////
	// 1. 모달창 히든 불러오기
	$('#searchBtn').click(function() {
		$('#background_modal').show();
	});
	// 2. 모달창 닫기 버튼
	$('.close').on('click', function() {
		$('#background_modal').hide();
	});
	// 3. 모달창 위도우 클릭 시 닫기
	$(window).on('click', function() {
		if (event.target == $('#background_modal').get(0)) {
            $('#background_modal').hide();
         }
	});
});
//아이디 & 스토어 값 저장하기 위한 변수
var idV = "";
// 아이디 값 받고 출력하는 ajax
var idSearch_click = function(){
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/user/userSearch?inputName_1="
				+$('#inputName_1').val()+"&inputPhone_1="+$('#inputPhone_1').val(),
		success:function(data){
			if(data == 0){
				$('#id_value').text("회원 정보를 확인해주세요!");	
			} else {
				$('#id_value').text(data);
				// 아이디값 별도로 저장
				idV = data;
			}
		}
	});
}
</script>
</head>
<body>

	<div class="full">
		<div class="container">
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-white">
					<h3>비밀번호 찾기</h3>
					<p>인증된 이메일만 정보 찾기가 가능합니다</p>
				</div>				
				<div id="searchP">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputId">아이디</label>
						<div>
							<input type="text" class="form-control" id="inputId" name="inputId_2" placeholder="ex) godmisu">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="form-control" id="inputEmail_2"	name="inputEmail_2" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn2" type="button" class="btn btn-primary btn-block">확인</button>
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
				</div>
				</div>
			</div>
		</div>
	</div>

	


</body>
</html>