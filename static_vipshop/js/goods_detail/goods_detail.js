$(document).ready(function () {
  /* -----------------分享---------------------- */
  $(".exhibition .inf .commodity_share").on("mouseenter", function () {
    $(this).css("background-color", "#ffffff");
    $(this)
      .children(".share_box")
      .addClass("active");
    $(this)
      .children(".share_pull")
      .css("display", "inline-block");
  });
  $(".exhibition .inf .commodity_share").on("mouseleave", function () {
    $(this).css("background-color", "#fafafa");
    $(this)
      .children(".share_box")
      .removeClass("active");
    $(this)
      .children(".share_pull")
      .css("display", "none");
  });
  /* --------------------倒计时---------------------*/
  //获取当前时间
  var now = new Date();
  //设置结束时间
  var deadline = 10;
  //获取要显示的区域
  var $Hour = $(".shopping_count_down .hours");
  var $Min = $(".shopping_count_down .mins");
  var $Sec = $(".shopping_count_down .sec");
  setInterval(function () {
    const ten = new Date();
    if (new Date(now).getHours() > deadline - 1) {
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
  /* 增加减少数量 */
  var isCanClick = $(".num_choice .num_show").text();
  if (isCanClick == 2) {
    $(".num_choice .num_minus").removeClass("cannot");
    $(".num_choice .num_add").addClass("cannot");
  }
  if (isCanClick < 2) {
    $(".num_choice .num_add").removeClass("cannot");
    $(".num_choice .num_minus").addClass("cannot");
  }
  $(".num_choice .num_add").on("click", function () {
    var num = $(".num_choice .num_show").text();
    $(".num_choice .num_show").text(parseInt(num) + 1);
    isCanClick = $(".num_choice .num_show").text();
    if (isCanClick == 2) {
      $(".num_choice .num_minus").removeClass("cannot");
      $(".num_choice .num_add").addClass("cannot");
    }
    if (isCanClick < 2) {
      $(".num_choice .num_add").removeClass("cannot");
      $(".num_choice .num_minus").addClass("cannot");
    }
  });
  $(".num_choice .num_minus").on("click", function () {
    var num = $(".num_choice .num_show").text();
    $(".num_choice .num_show").text(parseInt(num) - 1);
    isCanClick = $(".num_choice .num_show").text();
    if (isCanClick == 2) {
      $(".num_choice .num_minus").removeClass("cannot");
      $(".num_choice .num_add").addClass("cannot");
    }
    if (isCanClick < 2) {
      $(".num_choice .num_add").removeClass("cannot");
      $(".num_choice .num_minus").addClass("cannot");
    }
  });

  /* 商品参数  查看更多 */
  $(".information .table_view_more").on("click", function () {
    //判断
    var isHidden = $(".information tbody tr:last-child").hasClass("tr_hidden");
    if (isHidden) {
      $(".information tbody tr").removeClass("tr_hidden");
      $(".information .table_view_more span").css({
        transform: "rotate(0)",
        top: "2px"
      });
    } else {
      $(".information tbody tr")
        .eq(5)
        .addClass("tr_hidden");
      $(".information tbody tr")
        .eq(4)
        .addClass("tr_hidden");
      $(".information .table_view_more span").css({
        transform: "rotate(180deg)",
        top: "-3px"
      });
    }
  });
  /* 横向楼层跳转 */
  //默认显示第一个
  $(".level_floor_nav li").eq(0).addClass("active");
  /* 楼层导航跟随 */
  var level_floor_top = $(".level_floor_nav").offset().top;
  //设置放置楼层距离的数组
  var arr = [];
  $(".floor_index").each(function () {
    arr.push(parseInt($(this).offset().top));
  });
  $(window).scroll(function () {
    //var menu = $('.floor_nav');
    //获取scrollTop == 滚动的距离
    var scrollTop = $(this).scrollTop();
    // //临界值
    if (scrollTop > level_floor_top) {
      //随屏幕滚动
      $(".level_floor_nav").addClass("fixed");
      //活动层
      var IntScrollTop = parseInt(scrollTop);
      if (IntScrollTop >= arr[0]) {
        $(".level_floor_nav li").removeClass("active");
        $(".level_floor_nav li").eq(0).addClass("active");
      }
      if (IntScrollTop >= arr[1]) {
        $(".level_floor_nav li").removeClass("active");
        $(".level_floor_nav li").eq(1).addClass("active");
      }
      if (IntScrollTop >= arr[2]) {
        $(".level_floor_nav li").removeClass("active");
        $(".level_floor_nav li").eq(2).addClass("active");
      }
      if (IntScrollTop >= arr[3]) {
        $(".level_floor_nav li").removeClass("active");
        $(".level_floor_nav li").eq(3).addClass("active");
      }
      if (IntScrollTop >= arr[4]) {
        $(".level_floor_nav li").removeClass("active");
        $(".level_floor_nav li").eq(4).addClass("active");
      }
    } else {
      $(".level_floor_nav").removeClass("fixed");
    }
    $(".level_floor_nav li").on("click", function () {
      //获取索引
      var i = $(this).index();
      //获取楼层的scrollTop
      var top = $(".floor_index").eq(i).offset().top;
      top = top +50;
      $("html, body").stop(true).animate({ scrollTop: top });
    });
  });
  /* --------------------------分类查看评价-------------------------------- */
  $(".evaluate .evaluate_data .classify span")
    .eq(0)
    .addClass("active");
  $(".evaluate .evaluate_data .classify span").on("click", function () {
    $(".evaluate .evaluate_data .classify span").removeClass("active");
    $(this).addClass("active");
  });

  /* ------------------------------评价晒图-------------------------------------- */
  $(".evaluate_item .msg_img .msg_img_small").on("click", function () {
    var isZoom = $(this).css("cursor");
    var index = $(this).index();
    if (isZoom == "zoom-in") {
      //进行放大
      $(".evaluate_item .msg_img .msg_img_big").css("display", "none");
      $(".evaluate_item .msg_img .msg_img_small").css("cursor", "zoom-in");
      $(this)
        .siblings(".msg_img_big")
        .eq(index)
        .css("display", "block");
      $(this).css("cursor", "zoom-out");
    }
    if (isZoom == "zoom-out") {
      //还原
      $(this)
        .siblings(".msg_img_big")
        .eq(index)
        .css("display", "none");
      $(this).css("cursor", "zoom-in");
    }
  });
  $(".evaluate_item .msg_img .msg_img_big").on("click", function () {
    $(this).css("display", "none");
    $(".evaluate_item .msg_img .msg_img_small").css("cursor", "zoom-in");
  });
  /* ------------------------------页码跳转-------------------------------------- */
  //初始状态
  var nowPage = $(".evaluate_page .page_num").text();
  if (nowPage == 1) {
    $(".evaluate_page .page_prev").addClass("cannot");
  }
  //点击下一页
  $(".evaluate_page .page_next").on("click", function () {
    //重新获取页数
    nowPage = $(".evaluate_page .page_num").text();
    //操作
    $(".evaluate_page .page_num").text(parseInt(nowPage) + 1);
    $(".evaluate_page .page_show").text("第" + (parseInt(nowPage) + 1) + "页");
    //重新获取页数
    nowPage = $(".evaluate_page .page_num").text();
    //判断状态 大于1 上一页可点击
    if (nowPage > 1) {
      $(".evaluate_page .page_prev").removeClass("cannot");
      return;
    }
  });
  //点击上一页
  $(".evaluate_page .page_prev").on("click", function () {
    //重新获取页数
    nowPage = $(".evaluate_page .page_num").text();
    //操作
    $(".evaluate_page .page_num").text(parseInt(nowPage) - 1);
    $(".evaluate_page .page_show").text("第" + (parseInt(nowPage) - 1) + "页");
    //重新获取页数
    nowPage = $(".evaluate_page .page_num").text();
    //判断状态
    if (nowPage == 1) {
      $(".evaluate_page .page_prev").addClass("cannot");
      return;
    }
  });
  /* ----------------------------关于我们------------------------------- */
  $(".aboutUs .show .show_title i").on("click", function () {
    var index = $(this).index();
    $(".aboutUs .show .show_title i").removeClass("active");
    $(".aboutUs .show .show_des i").css("display", "none");
    $(".aboutUs .show .show_img .img_box").css("display", "none");
    $(".aboutUs .show .show_title i")
      .eq(index)
      .addClass("active");
    $(".aboutUs .show .show_des i")
      .eq(index)
      .css("display", "block");
    $(".aboutUs .show .show_img .img_box")
      .eq(index)
      .css("display", "block");
  });
});
//确保页面全部加载完成在运行JS
function windowload() {
  //查找元素
  var oTag = document.querySelectorAll(".exhibition .choiceImg .choice");
  var oPic = document.querySelectorAll(".exhibition .pic");
  var oPicImg = document.querySelectorAll(".bigImg .showImg");
  console.log(oPicImg);
  var oShow = document.querySelector(".exhibition .bigImg");
  var oLoupe = document.querySelector(".exhibition .loupe");
  var oMask = document.querySelector(".exhibition .mask");
  var oLoupePic = document.querySelector(".loupe_pic");
  var index = 0;
  //----选项卡---------------------------------------------------------------------------
  for (var i = 0; i < oTag.length; i++) {
    //存储点击的下标
    oTag[i].setAttribute("alt", i);
    oTag[i].onclick = function () {
      //原图
      for (var i = 0; i < oPic.length; i++) {
        oPicImg[i].style.display = "none";
      }
      //获取下标
      index = this.getAttribute("alt");
      oPicImg[index].style.display = "inline-block";
    };
  }
  //----放大镜--------------------------------------------------------------------------
  //show----鼠标移入事件
  oShow.onmousemove = function (e) {
    //记录选项卡中图片的src
    var oSrc = oPicImg[index].getAttribute("src");
    //根据 选项卡的图 更改放大的图
    oLoupePic.setAttribute("src", oSrc);
    //显示放大镜区域
    oLoupe.style.display = "block";
    //显示需要放大的mask
    oMask.style.display = "block";
    //show鼠标移动事件,mask同时也动
    //让鼠标在show中移动时始终在mask的中心位置
    //计算mask偏移量(鼠标当前位置clientX/Y - show到左/上的距离(此处为0) - mask的宽/高除2(mask的中心点))
    var x = e.pageX - oShow.offsetLeft - oShow.clientLeft - oMask.offsetWidth - 70;
    var y = e.pageY - oShow.offsetTop - oShow.clientTop - oMask.offsetHeight - 95;
    //设置mask边界值，不能小于0以及不能超过(show的宽高度 - mask的宽高度)
    //最小值
    x = x < 0 ? 0 : x;
    y = y < 0 ? 0 : y;
    //最大值
    x = x > oShow.offsetWidth - oMask.offsetWidth ? oShow.offsetWidth - oMask.offsetWidth : x;
    y = y > oShow.offsetHeight - oMask.offsetHeight ? oShow.offsetHeight - oMask.offsetHeight : y;
    //移动mask
    console.log("鼠标在oShow中的坐标：%d %d", x, y);
    oMask.style.left = x + "px";
    oMask.style.top = y + "px";
    //放大镜的图片显示移动
    //1、鼠标右移时放大镜的图左移 所以要负值
    //2.1、大图偏移量 = 大图活动区*(遮罩层偏移量/小图活动区)
    //2.2、大图偏移量 = (大图-大图显示区)*(遮罩层偏移量/(小图-遮罩层))
    var moveX = (oLoupePic.offsetWidth - oLoupe.clientWidth) * (x / (oShow.clientWidth - oMask.offsetWidth));
    var moveY = (oLoupePic.offsetHeight - oLoupe.clientHeight) * (y / (oShow.clientHeight - oMask.offsetHeight));
    oLoupePic.style.left = -moveX + "px";
    oLoupePic.style.top = -moveY + "px";
  };
  //show----鼠标移出事件
  oShow.onmouseleave = function () {
    //隐藏放大镜
    oLoupe.style.display = "none";
    //隐藏需要放大的mask
    oMask.style.display = "none";
  };
};
