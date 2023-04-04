/* --------------------------加载DOM---------------------------- */
$(window).ready(function () {
  /* ---------------------目录点击隐藏-------------------- */
  $('.catalog .title').on('click', function () {
    //判断
    var isShow = $(this).siblings('ul').is(':visible');
    if (isShow) {
      //隐藏
      $(this).siblings('ul').css('display', 'none');
      //更改i
      $(this).children('i').removeClass('icon_user_close');
      $(this).children('i').addClass('icon_user_open');
    } else {
      //显示
      $(this).siblings('ul').css('display', 'block');
      //更改i
      $(this).children('i').removeClass('icon_user_open');
      $(this).children('i').addClass('icon_user_close');
    }
  });
  /* ---------------------切换订单选项卡-------------------- */
  //初始状态
  $('.content .order_classify li').eq(0).addClass('active');
  //点击事件
  $('.content .order_classify li').on('click', function () {
    //样式改变
    $('.content .order_classify li').removeClass('active');
    $(this).addClass('active');
    //匹配数组的索引
    var index = $(this).index();
    //判断
    if (index == 0) {
      //全部订单
      $('.content .order_list li').css('display', 'block');
    }
    if (index == 1) {
      //待付款
      var $Li = $('.content .order_list li .order_state:contains(待付款)');
      $('.content .order_list li').css('display', 'none');
      $Li.parents('li').css('display','block');
    }
    if (index == 2) {
      //待收货
      var $Li = $('.content .order_list li .order_state:contains(待收货)');
      $('.content .order_list li').css('display', 'none');
      $Li.parents('li').css('display','block');
    }
    if (index == 3) {
      //已完成
      var $Li = $('.content .order_list li .order_state:contains(已完成)');
      $('.content .order_list li').css('display', 'none');
      $Li.parents('li').css('display','block');
    }
    if (index == 4) {
      //已取消
      var $Li = $('.content .order_list li .order_state:contains(已取消)');
      $('.content .order_list li').css('display', 'none');
      $Li.parents('li').css('display','block');
    }
  })
  /* ---------------------删除订单-------------------- */
  $('.content .order_list').on('click', '.order_del', function () {
    $(this).parents('li').remove();
  });
});