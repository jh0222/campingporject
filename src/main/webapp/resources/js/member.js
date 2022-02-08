//로그아웃
function logout() {
	let ok = confirm("로그아웃 하시겠습니까?")
	if(ok){
		location.href='member.logout';
	}
}

//회원가입
function joinCheck(){
	let name = document.joinForm.name;
	let id = document.joinForm.id;
	let pw = document.joinForm.pw;
	let pwChk = document.joinForm.pwChk;
	let email = document.joinForm.email;
	let email_address = document.joinForm.email_address;
	let phonenumber2 = document.joinForm.phonenumber2;
	let phonenumber3 = document.joinForm.phonenumber3;
	
	//아이디
	if (isEmpty(id)) {
        alert('아이디를 입력해주세요.');
        id.value = "";
        id.focus();
        return false;
	} else if (containKR(id)){
		alert('아이디에 영문만 넣어주세요.');
		id.value = "";
		id.focus();
		return false;
	} else if (lessThan(id, 3)){
		alert('아이디를 3자리 이상 입력해주세요.');
		id.value = "";
		id.focus();
		return false;		
	}
	
	if($("#idDoubleChk").val() != "true"){ 
		alert('아이디 중복확인을 해주세요');
		return false;	
	}

	//비번
	if (isEmpty(pw)) {
		alert('비밀번호를 입력해주세요.');
		pw.value = "";
		pw.focus();
		return false;
	} else if (lessThan(pw, 3)){
		alert('비밀번호를 3자리 이상 입력해주세요.');
		pw.value = "";
		pw.focus();
		return false;		
	} 
	
	if (notEquals(pw, pwChk)) {
		alert('비밀번호가 다릅니다.');
		pwChk.value = "";
		pwChk.focus();
		return false;
	}
	
	//이름
	if (isEmpty(name)) {
        alert('이름을 입력해주세요.');
        name.value = "";
        name.focus();

        return false;
	}
	
	//이메일
	if (isEmpty(email)) {
        alert('이메일을 입력해주세요.');
        email.value = "";
        email.focus();

        return false;
	}
	
	//핸드폰
	if (isEmpty(phonenumber2)) {
        alert('전화번호를 입력해주세요.');
        phonenumber2.value = "";
        phonenumber2.focus();

        return false;
	}
	
	if (isEmpty(phonenumber3)) {
        alert('전화번호를 입력해주세요.');
        phonenumber3.value = "";
        phonenumber3.focus();

        return false;
	}

	
	if(isNotNumber(phonenumber2)){
		alert('전화번호에 숫자만 입력해주세요.');
		phonenumber2.value = "";
		phonenumber2.focus();

        return false;
	}
	
	if(isNotNumber(phonenumber3)){
		alert('전화번호에 숫자만 입력해주세요.');
		phonenumber3.value = "";
		phonenumber3.focus();

        return false;
	}
	
	if(lessThan(phonenumber2,4)){
		alert('전화번호에 4자리를 입력해주세요.');
		phonenumber2.value = "";
		phonenumber2.focus();

        return false;
	}
	
	if(lessThan(phonenumber3,4)){
		alert('전화번호에 4자리를 입력해주세요.');
		phonenumber3.value = "";
		phonenumber3.focus();

        return false;
	}
		
}



function logincall(){
	let id = document.myForm.id;
	let pw = document.myForm.pw;
	
		if (isEmpty(id)) {
        alert('아이디를 입력해주세요.');
        id.value = "";
        id.focus();

        return false;
    }

	if (isEmpty(pw)) {
        alert('비밀번호를 입력해주세요.');
        pw.value = "";
        pw.focus();

        return false;
    }
}




$("#button1").click(function(){ 
	if($("#agreement1").prop("checked") && 
			$("#agreement2").prop("checked") && 
			$("#nameDoubleChk").val() == "true" && 
			$("#idDoubleChk").val() == "true" && 
			$("#pwDoubleChk").val() == "true" && 
			$("#emailDoubleChk").val() == "true" && 
			$("#phoneDoubleChk").val() == "true"){ 
		alert($('#sm_id').val()+"님 환영합니다. 선택해주셔서 감사합니다 :)"); 
	}else{ 
		alert("회원가입을 완료할 수 없습니다. 다시한번 확인해주십시오."); 
		
		if(!$("#agreement1").prop("checked")){ 
			$("label[for=agreement1]").text("동의 해주시기 바랍니다."); 
			$("label[for=agreement1]").css("color","red"); } 
		if(!$("#agreement2").prop("checked")) { 
			$("label[for=agreement2]").text("동의 해주시기 바랍니다.");
			$("label[for=agreement2]").css("color","red"); } 
		if($("#nameDoubleChk").val() != "true"){ 
			$(".successNameChk").text("이름를 입력해주세요 :)"); 
			$(".successNameChk").css("color", "red"); } 
		if($("#idDoubleChk").val() != "true"){ 
			$(".successIdChk").text("아이디를 입력해주세요 :)");
			$(".successIdChk").css("color", "red"); } 
		if($("#pwDoubleChk").val() != "true"){ 
			$(".successPwChk").text("비밀번호가 일치하지 않습니다 :)"); 
			$(".successPwChk").css("color", "red"); } 
		if($("#emailDoubleChk").val() != "true"){ 
			$(".successEmailChk").text("이메일 인증을 완료해주세요 :)"); 
			$(".successEmailChk").css("color", "red"); } 
		if($("#phoneDoubleChk").val() != "true"){ 
			$(".successPhoneChk").text("휴대폰 인증을 완료해주세요 :)");
			$(".successPhoneChk").css("color", "red"); } return false }
});

// 사용자 마이페이지
function userInfo(){
	location.href = "user.info";
}

// 사용자 탈퇴
function userBye(){
	let ok = confirm("정말 탈퇴하시겠습니까?");
	if (ok) {
		location.href = "user.bye";
	}
}

// 사장 마이페이지
function bossInfo(){
	location.href = "boss.info";
}

// 사장 탈퇴
function bossBye(){
	let ok = confirm("정말 탈퇴하시겠습니까?");
	if (ok) {
		location.href = "boss.bye";
	}
}

//취소/환불
function buydel(no){
	let ok = confirm("정말 취소/환불하시겠습니까?");
	if (ok) {
		location.href = "buy.del?b_no=" + no;
	}
}

//캠핑예약 취소
function reservedel(no){
	let ok = confirm("예약을 취소하시겠습니까?");
	if (ok) {
		location.href = "campingreserve.del?r_no=" + no;
	}
}

// 캠핑찜 취소
function campingjjimdel(no){
	if (ok) {
		location.href = "campingjjim.del?h_no=" + no;
	}
}
