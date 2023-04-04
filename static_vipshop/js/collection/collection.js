/* DOM加载完毕才能执行 */
$(document).ready(function () {
	/* -------------------------收藏中心导航跳转--------------------------- */
	//默认显示第一个
	$('.col_nav ul li').eq(0).find('a').addClass('active');
	//鼠标移入移出
	// $('.col_nav ul li').on('mouseenter', function () {
	// 	$(this).find('a').addClass('active');
	// });
	// $('.col_nav ul li').on('mouseleave', function () {
	// 	$(this).find('a').removeClass('active');
	// });
	/* -------------------------筛选--------------------------- */
	//默认显示第一个
	$('.filtrate ul li').eq(0).addClass('active');
	//点击事件
	$('.filtrate ul li').on('click', function () {
		$('.filtrate ul li').removeClass('active');
		$(this).addClass('active');
	});
	/* -------------------------取消收藏------------------------- */
	$('.col_list ul li').on('mouseenter', function () {
		$(this).find('#del').stop(true).animate({ 'right': '20px' });
	});
	$('.col_list ul li').on('mouseleave', function () {
		$(this).find('#del').stop(true).animate({ 'right': '-30px' });
	});
	$('.col_list').on('click', '#del', function () {
		$(this).parents('li').remove();
	})
});
