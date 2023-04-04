/* --------------------------加载DOM---------------------------- */
$(window).ready(function () {
  //初始化
  $('#target').distpicker('reset', true);
  var $distpicker = $('#target');
  //获取地址编辑区域的Top值
  var inputTop = $('.editTop').offset().top;
  //存储初始Li-->obj

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

  /*  ---------------------收货信息验证------------------  */
  var arr = [];
  $('.form').Validform({
    tiptype: function (msg, o, cssctl) {
      //o.obj 正在验证的元素-->用户名input  -->提示框
      var $tip = o.obj.siblings('.error-tip');
      var $input = o.obj;
      //展示信息
      // cssctl($tip, o.type);
      //修改提示信息
      $tip.text(msg);
      //tip显示/隐藏
      if (o.type == 3) {
        //没有验证通过
        $tip.fadeIn();
        $input.addClass('illegal');
      }
      if (o.type == 2) {
        //通过验证
        $tip.fadeOut();
        $input.removeClass('illegal');
      }
    },
  });
  /* ----------------------增加/修改 地址----------------------- */
  /*   var $name = $('.edit_box .name input');
    var $tel = $('.edit_box .tel input');
    var $time = $('.edit_box .time option:selected');
    var $province = $('.edit_box #province');
    var $city = $('.edit_box #city');
    var $district = $('.edit_box #district');
    var $detail_address = $('.edit_box .detail_address input');
    var $type = $('.edit_box .type input');
    var $setDefault = $('.edit_box .setDefault input'); */
  $('#save').on('click', function () {
    //获取表单val
    var name = $('.edit_box .name input').val().trim();
    var tel = $('.edit_box .tel input').val().trim();
    var time = $('.edit_box .time .time_sel').val().trim();
    var province = $('.edit_box #province').val().trim();
    var city = $('.edit_box #city').val().trim();
    var district = $('.edit_box #district').val().trim();
    var detail_address = $('.edit_box .detail_address input').val().trim();
    var type = $('.edit_box .type input:checked').next().text().trim();
    var setDefault = $('.edit_box .setDefault input:checked');
    //判断是否完善
    var not = $('error-tip').is(':visible');
    if (not || !name || !tel || !district || !detail_address) {
      //设置禁用
      $('#save').prop('disabled', true);
      return;
    } else {
      //取消禁用
      $('#save').prop('disabled', false);
    }
    var arr = [name, tel, time, province, city, district, detail_address, type, setDefault]
    console.log(arr);
    //判断是修改还是新增
    var isShow = $('#cancel').is(':visible');
    if (isShow) {
      //是修改
      //返回新值
      var $Li = $('.address_box li').eq(index);
    } else {
      //是新增
      //克隆
      var $Li = $('.address_box li').eq(0).clone(true);
    }
    //赋值
    $Li.find('.name span').text(arr[0]);
    $Li.find('.tel span').text(arr[1]);
    $Li.find('.location .province').text(arr[3]);
    $Li.find('.location .city').text(arr[4]);
    $Li.find('.location .district').text(arr[5]);
    $Li.find('.location .detail_address').text(arr[6]);
    //data存储
    var obj = {
      name: arr[0],
      tel: arr[1],
      province: arr[3],
      city: arr[4],
      district: arr[5],
      detail_address: arr[6],
      time: arr[2],
      type: arr[7],
    }
    $Li.data('msg', obj);
    //判断是否是默认地址
    if (arr[8]) {
      //原来的默认地址取消
      $('.address_box li').removeClass('isDefault');
      //删除按钮出现
      $('.address_box li #del').css('display', 'inline-block');
      //取消所有的不能点击
      $('.address_box li .default').removeClass('cannot');
      //隐藏非默认
      $('.address_box li.isDefault .default').stop(true).animate({ 'top': '-20px' });
      //当前设为默认
      $Li.addClass('isDefault');
      //隐藏默认地址的删除按钮
      $Li.find('.btn').children('#del').css('display', 'none')
      //默认的改成无法点击
      $Li.find('.default').addClass('cannot');
      //插入
      $('.address_box').append($Li);
    } else {
      //当前非默认
      $Li.removeClass('isDefault');
      //默认地址的删除按钮
      $Li.find('.btn').children('#del').css('display', 'inline-block')
      //默认的改成无法点击
      $Li.find('.default').removeClass('cannot');
      //插入
      $('.address_box').append($Li);
    }
    //清空val
    $('.edit_box .name input').val('');
    $('.edit_box .tel input').val('');
    $('.edit_box .time .time_sel').val('allday').trigger("change")
    $('.edit_box .detail_address input').val('');
    $('.edit_box .type input').prop('checked', false);
    $('.edit_box .setDefault input').prop('checked', false);
    //重置城市选择
    $('#target').distpicker('reset', true);
    //判断已保存的数量
    var Box_num = $('.address_box li').length;
    //赋值显示
    $('.save_box .now_num').text(Box_num);
    //返回按钮消失
    $('#cancel').css('display', 'none')
  })
  /* ----------------------修改信息----------------------- */
  $('.address_box li #edit').on('click', function () {
    //清空val
    $('.edit_box .name input').val('');
    $('.edit_box .tel input').val('');
    $('.edit_box .time .time_sel').val('allday').trigger("change");
    $('.edit_box .detail_address input').val('');
    $('.edit_box .type input').prop('checked', false);
    $('.edit_box .setDefault input').prop('checked', false);
    //重置城市选择
    $('#target').distpicker('reset', true);
    //定义一个全局变量
    index = $(this).parents('li').index();
    console.log(index);
    //弹出取消 按钮
    $('#cancel').css('display', 'inline-block')
    //移到信息编辑栏
    $('html, body').stop(true).animate({
      scrollTop: inputTop
    });
    //获取data数据
    var obj = $(this).parents('li').data('msg');
    console.log(obj);
    //传参
    $('.edit_box .name input').val(obj.name);
    $('.edit_box .tel input').val(obj.tel);
    $('.edit_box .time .time_sel').val(obj.time);
    $("#distpicker").distpicker('destroy');
    $("#distpicker").distpicker({
      autoSelect: false,
      placeholder: true
    });
    var $province = $("#province");
    $province.val(obj.province);
    $province.trigger("change");
    var $city = $("#city");
    $city.val(obj.city);
    $city.trigger("change");
    var $district = $("#district");
    $district.val(obj.district);
    $district.trigger("change");
    $('.edit_box .detail_address input').val(obj.detail_address);
    //判断type
    if (obj.type == "家庭") {
      $('.edit_box .type input').eq(0).trigger('click');
    }
    if (obj.type == "公司") {
      $('.edit_box .type input').eq(1).trigger('click');
    }
    if (obj.type == "其他") {
      $('.edit_box .type input').eq(2).trigger('click');
    }
    //判断是否是默认地址
    var isDefault = $(this).parents('li').hasClass('isDefault');
    if (isDefault) {
      //是默认地址----勾选默认
      $('.edit_box .setDefault input').trigger('click');
    } else {
      //不是
      return;
    }
  })
  /* ----------------------返回按钮----------------------- */
  $('#cancel').on('click', function () {
    $(this).parents('.input_box').css('display', 'none');
    //清空val
    $('.edit_box .name input').val('');
    $('.edit_box .tel input').val('');
    $('.edit_box .time .time_sel').val('allday').trigger("change");
    $('.edit_box .detail_address input').val('');
    $('.edit_box .type input').prop('checked', false);
    $('.edit_box .setDefault input').prop('checked', false);
    //重置城市选择
    $('#target').distpicker('reset', true);
  })
});