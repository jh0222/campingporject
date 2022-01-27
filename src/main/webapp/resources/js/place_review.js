//캠핑장 리뷰 delete
function reviewdelete(no,n) {
	let ok = confirm("삭제 하시겠습니까?")
	if(ok){
		location.href='review.del?c_no=' + no + '&c_cam_no=' + n + '&cam_no=' + n;
	}
}