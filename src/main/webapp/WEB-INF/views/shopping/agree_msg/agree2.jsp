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
        <div class="title">개인정보 제 3자 제공 동의</div>
        <div class="content">
캠핑쇼핑의 회원계정으로 상품 및 서비스를 구매하고자 할 경우, (주)캠핑쇼핑은 거래 당사자간 원활한 의사소통 및 배송, 상담 등 거래이행을 위하여 필요한 최소한의 개인정보만을 입점업체 판매자 및 배송업체에 아래와 같이 공유하고 있습니다.<br>
1. 입점업체 판매자로부터 상품 및 서비스를 구매하고자 할 경우, 개인정보보호법 제 17조 (개인정보의 제공)에 따라 아래와 같은 사항은 안내하고 동의를 받아 귀하의 개인정보를 판매자에게 공유합니다. "개인정보 제3자 공유 동의"를 체크하시면 개인정보 공유에 대해 동의한 것으로 간주합니다.<br>
2. 개인정보를 공유받는자 : (주)캠핑쇼핑<br>
3. 공유하는 개인정보 항목 - 구매자 정보: 성명, 전화번호, ID, 휴대전화 번호, 메일주소, 상품 구매정보 - 수령자 정보: 성명, 전화번호, 휴대전화 번호, 배송지 주소<br>
4. 개인정보를 공유받는 자의 이용 목적 : 판매자와 구매자의 거래의 원활한 진행, 본인의사의 확인, 고객 상담 및 불만처리, 상품과 경품 배송을 위한 배송지 확인 등<br>
5. 개인정보를 공유받는 자의 개인정보 보유 및 이용 기간 : 개인정보 수집 및 이용 목적 달성 시까지 보관합니다.<br>
6. 동의 거부 시 불이익 : 본 개인정보 공유에 동의하지 않으시는 경우, 동의를 거부할 수 있으며, 이 경우 거래가 제한됩니다.<br>
        </div>
        <div class="cmd">
            <button onclick="javascript:frameclose()" name="btnclose" class="button">닫기</button>
        </div>
    </div>
</body>
</html>