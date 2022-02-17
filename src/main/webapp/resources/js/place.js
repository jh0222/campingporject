//캠핑장 delete
function placedelete(no) {
	let ok = confirm("삭제 하시겠습니까?")
	if(ok){
		location.href='place.del?cam_no=' + no;
	}
}

//캠핑장 리뷰 delete
function reviewdelete(no,n) {
	let ok = confirm("삭제 하시겠습니까?")
	if(ok){
		location.href='review.del?c_no=' + no + '&c_cam_no=' + n + '&cam_no=' + n;
	}
}

//캠핑장 리뷰 update
function reviewupdate(no, t, n) {
	t = prompt("수정할 내용을 입력하세요.", t);
	if (t != null && t.length > 0 && t.length < 250) {
		location.href = 'review.update?c_no=' + no + '&c_campingreview=' + t + '&c_cam_no=' + n + '&cam_no=' + n;
	}
}

var submitFlag=false;

function submitCheck(){
	if(submitFlag){
		return submitFlag;
	}else{
		submitFlag=true;
		return false;
	}
}

function clickSubmit(){
	if(submitCheck()){return;}

}
