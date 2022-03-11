//캠핑장 delete
function placedelete(no) {
	let ok = confirm("삭제 하시겠습니까?")
	if(ok){
		location.href='place.del?cam_no=' + no;
	}
}

//캠핑장 리뷰 delete
function reviewdelete_place(no,n,id) {
	let ok = confirm("삭제 하시겠습니까?")
	if(ok){
		location.href='review.del?c_no=' + no + '&c_cam_no=' + n + '&cam_no=' + n + '&r_cam_no=' + n + '&r_u_id=' + id +'&h_cam_no=' + n + '&h_u_id=' + id;
	}
}

//캠핑장 리뷰 update
function reviewupdate_place(no, t, n,id) {
	t = prompt("수정할 내용을 입력하세요.", t);
	if (t != null && t.length > 0 && t.length < 250) {
		location.href = 'review.update?c_no=' + no + '&c_campingreview=' + t + '&c_cam_no=' + n + '&cam_no=' + n + '&r_cam_no=' + n + '&r_u_id=' + id +'&h_cam_no=' + n + '&h_u_id=' + id;
	}
}

//캠핑장 캠핑장 사장님 댓글 delete
function replydelete(no,m,n) {
	let ok = confirm("삭제 하시겠습니까?")
	if(ok){
		location.href='reply.del?cr_no=' + no +'&cr_cam_no=' + m+ '&cr_c_no=' + n + '&cam_no=' + m + '&c_cam_no=' + m;
	}
}

//캠핑장 사장님 댓글 update
function replyupdate(no, t, n) {
	t = prompt("수정할 내용을 입력하세요.", t);
	if (t != null && t.length > 0 && t.length < 250) {
		location.href = 'reply.update?cr_no=' + no + '&cr_replytxt=' + t + '&cr_cam_no=' + n + '&cam_no=' + n + '&c_cam_no=' + n;
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
