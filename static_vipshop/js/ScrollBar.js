/* -------------右侧固定栏------------ */
/* 用户中心 */
$('.scrollBar .user').on('mouseenter', function() {
	$('.scrollBar .user_icon').addClass('active');
	$('.scrollBar .user_box').stop(true).animate({
		'left': '-247px'
	});
});
$('.scrollBar .user').on('mouseleave', function() {
	$('.scrollBar .user_icon').removeClass('active');
	$('.scrollBar .user_box').stop(true).animate({
		'left': '40px'
	});
});
/* 我的订单  我的唯品币 触摸 */
$('.scrollBar .user_box .link_item').eq(0).on('mouseenter', function() {
	$(this).find('img').attr('src', 'img/index/order_%23df147f.png');
	$(this).find('span').css('color', '#df147f');
});
$('.scrollBar .user_box .link_item').eq(0).on('mouseleave', function() {
	$(this).find('img').attr('src', 'img/index/order_%23d9d9d9.png');
	$(this).find('span').css('color', '#666');
});
$('.scrollBar .user_box .link_item').eq(1).on('mouseenter', function() {
	$(this).find('img').attr('src', 'img/index/rmb_%23df147f.png');
	$(this).find('span').css('color', '#df147f');
});
$('.scrollBar .user_box .link_item').eq(1).on('mouseleave', function() {
	$(this).find('img').attr('src', 'img/index/rmb_%23d9d9d9.png');
	$(this).find('span').css('color', '#666');
});
/* 关闭 */
$('.scrollBar .user_box b ').on('click', function() {
	$('.scrollBar .user_icon').removeClass('active');
	$('.scrollBar .user_box').stop(true).animate({
		'left': '40px'
	});
});
/* 购物袋 */
$('.scrollBar .shoppingCart .shoppingCart_icon').on('click', function() {
	var isClick = $('.scrollBar .shoppingCart_box').hasClass('active');
	if (!isClick) {
		$('.scrollBar .shoppingCart_box').stop(true).animate({
			'left': '-247px'
		});
		$('.scrollBar .shoppingCart_box').addClass('active');
	} else {
		$('.scrollBar .shoppingCart_box').stop(true).animate({
			'left': '40px'
		});
		$('.scrollBar .shoppingCart_box').removeClass('active');
	}
});
/* 关闭 */
$('.scrollBar .shoppingCart_box b ').on('click', function() {
	$('.scrollBar .shoppingCart_box').stop(true).animate({
		'left': '40px'
	});
	$('.scrollBar .shoppingCart_box').removeClass('active');
});
/* 其他菜单弹出 */
$('.scrollBar .unify_item').on('mouseenter', function() {
	$(this).children('.unify_icon').addClass('active');
	$(this).children('.unify_box').stop(true).animate({
		'left': '-122px'
	}, 200)
});
$('.scrollBar .unify_item').on('mouseleave', function() {
	$(this).children('.unify_icon').removeClass('active');
	$(this).children('.unify_box').stop(true).animate({
		'left': '0'
	}, 200)
});
/* 返回顶部 */
$('.scrollBar .backTop .backTop_icon').click(function() {
	$('html, body').animate({
		scrollTop: 0
	});
});
