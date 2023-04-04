//模拟数据 (模拟返回值数据：此数据需要返回给页面进行展示)
//注册功能实现
//登录功能
Mock.mock('/user/login', 'post', {
    'errno': '@integer(0,1)', //模拟0,1 2个数字
    'errmsg': '@ctitle(5,20)', //模拟字符串数据，字符串长度:5-20
    'token': '@guid', // uuid字符串，用来单点登录
    'name': '@cname'
})

// res.data = {}
//模拟搜索条件参数数据
Mock.mock("/conditionSearch", "get", {
    //品牌数据
    'brand_list|0-6': [
        {
            'id|+1': 1,
            'brand_name': '@ctitle(2,4)',
            'logo': '@dataImage(60x20,华为)',
            'link': '@url(http)'
        }
    ],
    //分类数据
    'category_goods|0-10': [
        {
            'id|+1': 1,
            'category_name': '@ctitle(2,6)',
            'link': '@url(http)'
        }
    ],
    //规格列表
    'spec_list|0-8': [
        {
            'id|+1': 1,
            'spec_name': '@ctitle(2,4)',
            'selected|1': false,
            //属性选项
            'options|4-6': [
                {
                    'id|+1': 1,
                    'option_name': '@ctitle(2,6)'
                }
            ]
        }
    ]

})



//登录状态添加购物车，发送请求，把购物车数据添加到服务器
Mock.mock("/cart/addcart", "post", {
    'errno': '@integer(0,1)',
    'errmsg': '@ctitle(5,20)'
})

//模拟登录状态购物车数据列表
Mock.mock("/carts/list", "get", {
    //数组
    'carts|1-6': [
        {
            'skuid': '@integer(100000,10000000)',
            'count': '@integer(1,6)',
            'checked|1': true,
            'midlogo': '@dataImage(130x130)',
            'goods_name': '@ctitle(6,16)',
            'price': '@float(1,1000,2,2)',
            'spec_info': '颜色:玫瑰金|内存:128G'
        }
    ]
})

//登录状态修改购物车，发送请求，把购物车修改后数据添加到服务器
Mock.mock("/update/cart", "put", {
    'errno': '@integer(0,1)',
    'errmsg': '@ctitle(5,20)'
})

//登录状态删除购物车，发送请求，把购物车删除后数据添加到服务器
Mock.mock("/delete", "get", {
    'errno': '@integer(0,1)',
    'errmsg': '@ctitle(5,20)'
})



//模拟数据，添加新增的收货人地址
Mock.mock("/address", "post", {
    'errno': '@integer(0,1)',
    'errmsg': '@ctitle(5,20)',
    'id': '@id'
})

//模拟数据，提交订单
Mock.mock("/orders", "post", {
    'errno': '@integer(0,1)',
    'errmsg': '@ctitle(5,20)',
    'sn': '@id'
})

//模拟数据，返回支付地址
Mock.mock("/pay", "post", {
    'errno': '@integer(0,1)',
    'errmsg': '@ctitle(5,20)',
    'wxurl': '@url(http)'
})

//模拟数据，定时检查二维码支付状态，查询是否支付成功
Mock.mock(/\/order_status/, "get", {
    'errno': '@integer(0,1)',
    'errmsg': '@ctitle(5,20)',
    'pay_status': '0'
})

//秒杀接口返回值订单
Mock.mock("/seckill/goods", "get", {
    'seckill_times|5': [
        {
            'id|+1': 1,
            'start_time': '@date',
            'end_time': '@date',

        }
    ],
    'seckill_goods|6-12': [
        {
            'id|+1': 1,
            'goods_name': '@ctitle',
            //原价
            'price': '@float(1,9999,2,2)',
            //打折后的价格
            'cost_price': '@float(1,9999,2,2)',
            //库存
            'num': '999',
            //剩余库存
            'stock_count': '888',
            //秒杀图片
            'pic': '@dataImage(130x130)',
            //秒杀开始时间
            'start_time': '@date',
            //秒杀结束时间
            'end_time': '@date',
            'desc': '@ctitle'
        }
    ]
})
