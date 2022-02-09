//-----------------캠핑용품 페이지
function del(no) {
	let ok = confirm('해당상품을 삭제 합니까?');
	if(ok) {
		location.href = "del.product?p_no=" + no;
	}
}

//밀키트 페이지
function m_del(no) {
	let ok = confirm('해당상품을 삭제 합니까?');
	if(ok) {
		location.href = "del.milkit?fp_no=" + no;
	}
}