//캠핑delete
function placedelete(no) {
	let ok = confirm("삭제 하시겠습니까?")
	if(ok){
		location.href='place.del?cam_no=' + no;
	}
}3