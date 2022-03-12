//체크박스 선택시 '기존배송지' 뜨도록 

$(document).ready(function(){
	$("#offline2").change(function(){         
	        if($("#offline2").is(":checked")){
	           $("#recipient").val("");
	        }else{
	        	$("#recipient").val("");
	        }
	    });

	});

$(document).ready(function(){
	$("#offline2").change(function(){         
	        if($("#offline2").is(":checked")){
	           $("#phonenumber").val("");
	        }else{
	        	$("#phonenumber").val("");
	        }
	    });

	});
$(document).ready(function(){
	$("#offline2").change(function(){         
	        if($("#offline2").is(":checked")){
	           $("#addr").val("");
	        }else{
	        	$("#addr").val("");
	        }
	    });

	});

/* 뷰 : <input type="checkbox" name="offline" id="offline" value="2"/> */

//배송 시 요청사항
$(document).ready(function(){
	$("#addrmsg").change(function(){         
		if($("#addrmsg option:selected").text()) 
			$("#addrtext").val($("#addrmsg option:selected").text());
	    });

	});
	
//이용약관 체크박스
	$(document).ready(function() {
		$("#cbx_chkAll").click(function() {
			if($("#cbx_chkAll").is(":checked")) $("input[class=chkclass]").prop("checked", true);
			else $("input[class=chkclass]").prop("checked", false);
		});
		
		$("input[class=chkclass]").click(function() {
			var total = $("input[class=chkclass]").length;
			var checked = $("input[class=chkclass]:checked").length;
			
			if(total != checked) $("#cbx_chkAll").prop("checked", false);
			else $("#cbx_chkAll").prop("checked", true); 
		});
	});

	//체크박스 클릭에 따라 배송지 보여주기
	$(document).ready(function(){
		let chkOk = true;
		$("#offline2").change(function(){
				$("#addr").prop('disabled', true); //비활성화
				if(chkOk){//true이면
		           $("#addrtable").show();
		           chkOk = false;
		        }else{
		           $("#addrtable").hide();
		           chkOk = true;
		        }
		    });
		$("#offline1").change(function(){
			$("#addr").prop('disabled', false);	//활성화
			window.location.reload(); //새로고침
			chkOk = true;
			if(chkOk){
	           $("#addrtable").hide();
	           chkOk = true;
	        }else{
	        	$("#addrtable").show();
	            chkOk = false;
	        }
	    });

	});

	//체크박스 중복방지
	function addrCheck(chk){
	    var obj = document.getElementsByName("offline1");//name값
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){ 
	            obj[i].checked = false;
	        }
	        if(obj[i] = chk){
	        	obj[i].cheked = true;
	        }
	    }
	}

	//체크박스 유효성검사
	function checkForm(check){
	    //체크박스 체크여부 확인 
	    var chk1=document.getElementById('chk1').checked;
	    var chk2=document.getElementById('chk2').checked;
	    var chk3=document.getElementById('chk3').checked;
	    var chk4=document.getElementById('chk4').checked;
	    
	    if(!chk1){
	        alert('약관1에 동의해 주세요');
	        return false;
	    } 
	    if(!chk2) {
	        alert('약관2에 동의해 주세요');
	        return false;
	    }
	    if(!chk3) {
	        alert('약관3에 동의해 주세요');
	        return false;
	    }
	    if(!chk4) {
	        alert('약관4에 동의해 주세요');
	        return false;
	    }
	    
	/*     alert('aaa'); */
	    call_kakao1();
	    
	    
	    
	}	
	
	//체크박스 유효성검사
	function CheckFrom1(check){
	    //체크박스 체크여부 확인 
	    var chk1=document.getElementById('chk01').checked;
	    var chk2=document.getElementById('chk02').checked;
	    var chk3=document.getElementById('chk03').checked;
	    var chk4=document.getElementById('chk04').checked;
	    
	    if(!chk01){
	        alert('약관1에 동의해 주세요');
	        return false;
	    } 
	    if(!chk02) {
	        alert('약관2에 동의해 주세요');
	        return false;
	    }
	    if(!chk03) {
	        alert('약관3에 동의해 주세요');
	        return false;
	    }
	    if(!chk04) {
	        alert('약관4에 동의해 주세요');
	        return false;
	    }
	    
	/*     alert('aaa'); */
	    call_kakao2();
	    
	    
	    
	}	
	
	
//팝업창 띄우기	
function showPopup1() { window.open("agree1", "a", "width=400, height=300, left=800, top=300" ); }
function showPopup2() { window.open("agree2", "a", "width=400, height=300, left=800, top=300"); }
function showPopup3() { window.open("agree3", "a", "width=400, height=300, left=800, top=300"); }
function showPopup4() { window.open("agree4", "a", "width=400, height=300, left=800, top=300"); }


