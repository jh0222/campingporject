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
        <div class="title">전자결제대행 이용 동의</div>
        <div class="content">
제1조 (목적)<br>
이 약관은 전자지급결제대행서비스 및 결제대금예치서비스를 제공하는 토스페이먼츠 주식회사(이하 '회사'라 합니다)와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함으로써 전자금융거래의 안정성과 신뢰성을 확보함에 그 목적이 있습니다.<br>
제2조 (용어의 정의)<br>
이 약관에서 정하는 용어의 정의는 다음과 같습니다.<br>
① 전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의 구성원과 직접 대면하거나 의사소통을 하지 아니하고 전산화된 방식으로 이를 이용하는 거래를 말합니다.<br>
② '전자지급결제대행 서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.<br>
③ ‘결제대금예치서비스'라 함은 이용자가 재화의 구입 또는 용역의 이용에 있어서 그 대가(이하 '결제대금'이라 한다)의 전부 또는 일부를 재화 또는 용역(이하 '재화 등'이라 합니다)을 공급받기 전에 미리 지급하는 경우, 회사가 이용자의 물품수령 또는 서비스 이용 확인 시점까지 결제대금을 예치하는 서비스를 말합니다.<br>
④ '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자지급결제대행 서비스를 이용하는 자를 말합니다.<br>
⑤ '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 금융기관 또는 전자금융업자에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.<br>
⑥ '거래지시'라 함은 이용자가 전자금융거래계약에 따라 금융기관 또는 전자금융업자에게 전자금융거래의 처리를 지시하는 것을 말합니다.<br>
⑦ '오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.<br>
        </div>
        <div class="cmd">
            <button onclick="javascript:frameclose()" name="btnclose" class="button">닫기</button>
        </div>
    </div>
</body>
</html>