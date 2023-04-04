/* DOM加载完毕才能执行 */
$(document).ready(function() {

	/* 唯品快抢  动态变化 */
	function rotate() {
		var isShow = $('.quickly .quickly_show .list_1').is(':visible');
		if (isShow) {
			$('.quickly .quickly_show .list_1').hide();
			$('.quickly .quickly_show .list_2').show();
		} else {
			$('.quickly .quickly_show .list_2').hide();
			$('.quickly .quickly_show .list_1').show();
		}
	};
	rotate();
	var timer = setInterval(function() {
		rotate();
	}, 3000);
	// /* --------------------倒计时---------------------*/
	//获取当前时间
	var now = new Date();
	//设置结束时间
	var deadline = 10;
	//获取要显示的区域
	var $Hour = $('.handpick .count_down .hours');
	var $Min = $('.handpick .count_down .minutes');
	var $Sec = $('.handpick .count_down .seconds');
	setInterval(function() {
		const ten = new Date();
		if (new Date(now).getHours() > deadline-1) {
			ten.setDate(new Date(now).getDate() + 1);
		}
		ten.setHours(deadline);
		ten.setMinutes(0);
		ten.setSeconds(0);
		const interval = Math.ceil(ten.valueOf() - new Date(now).valueOf()) / 1000;
		const hour = Math.floor(interval / 3600);
		const minutes = Math.floor((interval % 3600) / 60);
		const second = Math.floor(interval % 60);
		now = Date.now();
		//判断
		function fix(x) {
			if (x < 10) {
				return "0" + x;
			} else {
				return x;
			}
		}
		//放入显示的数字
		$Hour.text(fix(hour));
		$Min.text(fix(minutes));
		$Sec.text(fix(second));
	});
	//默认显示第一个
	$('.floor_nav li').eq(0).addClass('active');
	/* 楼层导航跟随 */
	var floor_top = $('.update_title').offset().top;
	//设置放置楼层距离的数组
	var arr = [];
	$('.floor_index').each(function () {
		arr.push(parseInt($(this).offset().top));
	});
	console.log(arr);
	$(window).scroll(function() {
		//获取scrollTop == 滚动的距离
		var scrollTop = $(this).scrollTop();
		// //临界值
		if (scrollTop > floor_top) {
			$('.floor_nav').addClass('fixed');
			//活动层
			var IntScrollTop = parseInt(scrollTop);
			if(IntScrollTop > arr[0]){
				$('.floor_nav li').removeClass('active');
				$('.floor_nav li').eq(0).addClass('active');
			}
			if(IntScrollTop > arr[1]){
				$('.floor_nav li').removeClass('active');
				$('.floor_nav li').eq(1).addClass('active');
			}
			if(IntScrollTop > arr[2]){
				$('.floor_nav li').removeClass('active');
				$('.floor_nav li').eq(2).addClass('active');
			}
			if(IntScrollTop > arr[3]){
				$('.floor_nav li').removeClass('active');
				$('.floor_nav li').eq(3).addClass('active');
			}
			if(IntScrollTop > arr[4]){
				$('.floor_nav li').removeClass('active');
				$('.floor_nav li').eq(4).addClass('active');
			}
			if(IntScrollTop > arr[5]){
				$('.floor_nav li').removeClass('active');
				$('.floor_nav li').eq(5).addClass('active');
			}
			if(IntScrollTop > arr[6]){
				$('.floor_nav li').removeClass('active');
				$('.floor_nav li').eq(6).addClass('active');
			}
			if(IntScrollTop > arr[7]){
				$('.floor_nav li').removeClass('active');
				$('.floor_nav li').eq(7).addClass('active');
			}
			if(IntScrollTop > arr[8]){
				$('.floor_nav li').removeClass('active');
				$('.floor_nav li').eq(8).addClass('active');
			}
			if(IntScrollTop > arr[9]){
				$('.floor_nav li').removeClass('active');
				$('.floor_nav li').eq(9).addClass('active');
			}
			if(IntScrollTop > arr[10]){
				$('.floor_nav li').removeClass('active');
				$('.floor_nav li').eq(10).addClass('active');
			}
			if(IntScrollTop > arr[11]){
				$('.floor_nav li').removeClass('active');
				$('.floor_nav li').eq(11).addClass('active');
			}
			if(IntScrollTop > arr[12]){
				$('.floor_nav li').removeClass('active');
				$('.floor_nav li').eq(12).addClass('active');
			}
		} else {
			$('.floor_nav').removeClass('fixed');
		}
	});
	/* 楼层跳转 */
	$('.floor_nav li').click(function() {
		//获取索引
		var i = $(this).index();
		//获取楼层的scrollTop
		var top = $('.floor_index').eq(i).offset().top;
		top = top +20;
		$('html, body').stop(true).animate({
			scrollTop: top
		});
	});
	/* 遮罩 */
	$('.update .item_show').on('mouseenter', function() {
		$(this).children('.item_collection').animate({
			'opacity': '1'
		});
		$(this).children('.item_mask').css({
			'background-color': 'rgba(255, 255, 255, 0.3)'
		});
	});
	$('.update .item_show').on('mouseleave', function() {
		$(this).children('.item_collection').animate({
			'opacity': '0'
		});
		$(this).children('.item_mask').css({
			'background-color': 'rgba(255, 255, 255, 0)'
		});
	});
});
