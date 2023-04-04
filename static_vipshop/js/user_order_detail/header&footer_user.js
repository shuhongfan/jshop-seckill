/* DOM加载完毕才能执行 */
$(document).ready(function() {
	/* 城市选择 */
	$('.top_nav .location .show_city').on('click', function() {
		//判断是否展开
		var isShow = $('.top_nav .city_select').is(':visible');
		if (!isShow) {
			//展开选择
			$('.top_nav .location').addClass('selected');
			$('.top_nav .city_select').css('display', 'inline-block');
			return;
		} else {
			//关闭选择
			$('.top_nav .location').removeClass('selected');
			$('.top_nav .city_select').css('display', 'none');
			return;
		}
	});
	$('.top_nav .location .del').on('click', function() {
		//关闭选择
		$('.top_nav .location').removeClass('selected');
		$('.top_nav .city_select').css('display', 'none');
	});
	/* 登录 鼠标移入登录 */
	$('.top_nav .login').on('mouseenter', function() {
		$('.top_nav .login .title').addClass('show');
		$('.top_nav .login .login_box').css('display', 'inline-block')
	});
	$('.top_nav .login').on('mouseleave', function() {
		$('.top_nav .login .title').removeClass('show');
		$('.top_nav .login .login_box').css('display', 'none')
	});
	/* 我的特卖 会员俱乐部 客户服务 */
	$('.top_nav .pull_down').on('mouseenter', function() {
		$(this).find('.title').addClass('show');
		$(this).find('.box').css('display', 'inline-block')
	});
	$('.top_nav .pull_down').on('mouseleave', function() {
		$(this).find('.title').removeClass('show');
		$(this).find('.box').css('display', 'none')
	});
	/* 移动端 二维码 */
	$('.top_nav .mobileCode').on('mouseenter', function() {
		$('.top_nav .mobileCode .title').addClass('show');
		$('.top_nav .mobileCode .box').css('display', 'inline-block')
	});
	$('.top_nav .mobileCode').on('mouseleave', function() {
		$('.top_nav .mobileCode .title').removeClass('show');
		$('.top_nav .mobileCode .box').css('display', 'none')
	});
	/* 查看更多 */
	$('.top_nav .more').on('mouseenter', function() {
		$('.top_nav .more .title').addClass('show');
		$('.top_nav .more .box').css('display', 'inline-block')
	});
	$('.top_nav .more').on('mouseleave', function() {
		$('.top_nav .more .title').removeClass('show');
		$('.top_nav .more .box').css('display', 'none')
	});
	/* 购物袋 */
	$('.top_content .shoppingCart').on('mouseenter', function() {
		$('.top_content .shoppingCart .title').addClass('show');
		$('.top_content .shoppingCart').addClass('bgcolor');
		$('.top_content .shoppingCart .box').css('display', 'inline-block');
	});
	$('.top_content .shoppingCart').on('mouseleave', function() {
		$('.top_content .shoppingCart .title').removeClass('show');
		$('.top_content .shoppingCart').removeClass('bgcolor');
		$('.top_content .shoppingCart .box').css('display', 'none');
	});
	/* 搜索下拉框 */
	$('.top_content .search input').on('focus', function() {
		$(this).parents('.input_box').siblings('.pullDown').css('display', 'inline-block');
	});
	$('.top_content .search input').on('blur', function() {
		$(this).parents('.input_box').siblings('.pullDown').css('display', 'none');
	});
	/* 底部链接区 */
	$('.footer .link ul li').on('mouseenter', function() {
		$(this).css({
			'color': 'rgb(250, 42, 131)',
			'margin-left': '5px'
		});
		$(this).children('a').css('color', 'rgb(250, 42, 131)');
	});
	$('.footer .link ul li').on('mouseleave', function() {
		$(this).css({
			'color': 'grey',
			'margin-left': '0px'
		});
		$(this).children('a').css('color', 'grey');
	});

});
