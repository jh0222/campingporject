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
			if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
			else $("input[name=chk]").prop("checked", false);
		});
		
		$("input[name=chk]").click(function() {
			var total = $("input[name=chk]").length;
			var checked = $("input[name=chk]:checked").length;
			
			if(total != checked) $("#cbx_chkAll").prop("checked", false);
			else $("#cbx_chkAll").prop("checked", true); 
		});
	});

//팝업창 띄우기	
function showPopup1() { window.open("agree1", "a", "width=400, height=300, left=800, top=300" ); }
function showPopup2() { window.open("agree2", "a", "width=400, height=300, left=800, top=300"); }
function showPopup3() { window.open("agree3", "a", "width=400, height=300, left=800, top=300"); }
function showPopup4() { window.open("agree4", "a", "width=400, height=300, left=800, top=300"); }


