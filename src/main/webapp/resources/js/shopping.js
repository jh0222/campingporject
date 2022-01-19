function del(no) {
	let ok = confirm('해당상품을 삭제 합니까?');
	if(ok) {
		location.href = "del.product?p_no=" + no;
	}
}