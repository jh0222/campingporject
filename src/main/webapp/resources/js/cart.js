$("#allCheck").click(function(){
 		var chk = $("#allCheck").prop("checked"); // .prop = true/false
 		if(chk) {
  			$(".chBox").prop("checked", true); // 체크박스 O
 		} else {
  			$(".chBox").prop("checked", false); // 체크박스 X
 		}
	});

$(".chBox").click(function(){
		$("#allCheck").prop("checked", false); // 전체선택 했을때 
	});

$(".selectDelete_btn").click(function(){
	
 var confirm_val = confirm("정말 삭제하시겠습니까?");
 
 if(confirm_val) {
  var checkArr = new Array();
  
  $("input[class='chBox']:checked").each(function(){
   checkArr.push($(this).attr("data-cartNum"));
  });
   
  $.ajax({
   url : "/UserdeleteCart",
   type : "post",
   data : { chbox : checkArr },
   success : function(){
    location.href = "/UserCart";
   }
  });
 } 
});
