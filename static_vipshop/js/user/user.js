/* --------------------------加载DOM---------------------------- */
$(window).ready(function () {
  /* ---------------------目录点击隐藏-------------------- */
  $('.catalog .title').on('click', function () {
    //判断
    var isShow = $(this).siblings('ul').is(':visible');
    if(isShow){
      //隐藏
      $(this).siblings('ul').css('display', 'none');
      //更改i
      $(this).children('i').removeClass('icon_user_close');
      $(this).children('i').addClass('icon_user_open');
    }else{
        //显示
        $(this).siblings('ul').css('display', 'block');
        //更改i
        $(this).children('i').removeClass('icon_user_open');
        $(this).children('i').addClass('icon_user_close');
    }
  });
  /* ---------------------鼠标移入头像，显示编辑头像-------------------- */
  $('.information .user_inf .user_header').on('mouseenter', function () {
    $(this).children('span').stop(true).animate({'bottom':'0'})
  });
  $('.information .user_inf .user_header').on('mouseleave', function () {
    $(this).children('span').stop(true).animate({'bottom':'-20px'})
  });
});