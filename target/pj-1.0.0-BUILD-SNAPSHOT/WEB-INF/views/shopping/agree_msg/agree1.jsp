<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function frameclose() { 
	parent.close() 
	window.close() 
	self.close() 
	} 
</script>
<style type="text/css">
.popup > .title{
    border-radius: 15px 15px 0 0;
    min-height: 40px;
    color: #fff;
    background-color: #b66;
    padding: 10px 15px;
    box-sizing: border-box;
    font-weight: bold;
}
.popup > .content {
    padding: 20px;
    box-sizing: border-box;
}
.popup > .cmd {
    bottom: 0;
    min-height: 40px;
    padding: 15px 15px;
    box-sizing: border-box;
    border-radius: 0 0 15px 15px;
    min-height: 40px;
    text-align: right;
}
.popup > .cmd .button {
    border-radius: 8px;
    padding: 5px 10px;
    border: 1px solid #aaa;
}
.popup > .cmd .button:hover {
    color: #fff;
    background-color: #000;
    border-color: #000;
}
</style>
</head>

<body class="dimmed">
    <div class="popup">
        <div class="title">개인정보 수집 및 이용 동의</div>
        <div class="content">
1. 수집목적<br>
판매자와 구매자의 거래의 원활한 진행, 본인의사의 확인, 고객 상담 및 불만처리, 상품과 경품 배송을 위한 배송지 확인 등<br>
2. 수집 항목<br>
구매자 정보: 성명, 전화번호, ID, 휴대전화 번호, 메일주소, 상품 구매정보<br>
수령자 정보: 성명, 전화번호, 휴대전화 번호, 배송지 주소<br>
3. 보유기간<br>
개인정보 수집 및 이용목적 달성 시 및 관련 법령에 따른 기간까지 보관<br>
4. 동의 거부시 불이익<br>
본 개인정보 수집 및 이용 등에 동의하지 않을 권리가 있습니다. 다만, 필수항목에 동의를 하지 않을경우 거래가 제한될 수 있습니다.<br>
        </div>
        <div class="cmd">
            <button onclick="javascript:frameclose()" name="btnclose" class="button">닫기</button>
        </div>
    </div>
</body>
</html>