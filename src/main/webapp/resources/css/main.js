$(function() {
	$('#fullpage').fullpage({
		//options here
		anchors: ['section1', 'section2', 'section3', 'section4', 'section5'],
		autoScrolling:true,
		scrollHorizontally: true,
		navigation:true,
		navigationPosition:'right',
		sectionsColor: ['#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff']
	});
});

/*
 $(function() {
	$('#fullpage').fullpage({
		//options here
		anchors: ['section1', 'section2', 'section3', 'section4', 'section5'],
		navigation:true,
		navigationPosition:'right'
	});
});

main.css가서 header{z-index:100;} 해주면 메뉴클릭시 페이지로 이동함
*/