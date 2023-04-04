/* 所有ajax的代码写到这里 : 此基础路径是网关服务器路径*/
//axios.defaults.baseURL='http://localhost:8180'
axios.defaults.baseURL='http://localhost:9000'

// 设置AJAX超时时间
axios.defaults.timeout = 3000


// 设置提交数据时的格式
axios.defaults.headers['Content-Type'] = 'application/json;charset=utf-8'

// 设置前置拦截器->以后所有的AJAX都会自动添加上 Authorization:token 的协议头
axios.interceptors.request.use(function (config) {
    // 判断如果用户登录了就把 token 配置上 axios 的协议头中
    let token = localStorage.getItem('token')
    if (token) {
        config.headers['Authorization'] = token
    }
    // 处理请求前代码
    return config;
}, function (error) {
    // Do something with request error
    return Promise.reject(error);
});



//编写ajax请求代码
//秒杀请求
function startSeckillSubmitOrder(seckillId){
    return axios.get("/seckill/startSubmitOrder/"+seckillId);
}
//获取订单详情
function getOrder(orderId){
    return axios.get("/seckill/startSubmitOrder/"+orderId);
}
//支付宝支付
function getAliPay(orderId){
    return axios.get("/pay/createTradePay/"+orderId);
}
//获取订单金额
function getOrderMoney(orderId){
    return axios.get("/pay/getOrderMoney/"+orderId);
}
//发送短信请求
function sms(params){
    return axios.post("/user/sms",params);
}

//获取用户名
function userInfo(token){
    return axios.get("/login/getLoginUser/"+token);
}

//获取秘钥
function login(params){
    return axios.post("/login/login",params);
}

//领取优惠券
function getTicket(seckillId){
    return axios.get("/coupon/receive/"+seckillId);
}

//获取商品详细信息
function goodsDetails(seckillId){
    //axios.post(url,你的参数);
    //axios.get(url,{params:你的参数})
    return axios.get("/seckill/goods/detail/"+seckillId);
}

//获取商品轮播图
function getImageGoods(seckillId){
    return axios.get("/seckill/goods/image/"+seckillId);
}

//查询秒杀商品列表
function getGoodsListByPage(pageNo,pageSize){
    return axios.get("/seckill/goods/list/"+pageNo+"/"+pageSize);
}

//获取商品详细信息8
function getImageGoods(seckillId){
    return axios.get("/seckill/goods/image/"+seckillId);
}

//商品分类数据加载 ，首页左侧分类菜单加载
function showCategorys(){
    return axios.get("/index/categorys");
}

//加载首页楼层数据
function showFloors(){
    return axios.get("/index/floors");
}

//api发送请求，实现搜索
function searchList(searchMap){
    return axios.post("/search/searchList",searchMap);
}

//发送请求，获取搜索条件参数
function searchCondition(cat_id){
    return axios.get("/search/conditionSearch?cat_id="+cat_id);
}

//查询商品详情数据
function showItem(spu_id){
    return axios.get("/item/goods?spu_id="+spu_id);
}

//查询商品评论
function showComments(params){
    return axios.post("/item/comments",params);
}

//登录状态添加购物车，发送请求，把购物车数据添加到服务器
//skuid,count
function addToCart(params){
    return axios.post("/cart/addcart",params);
}

//模拟登录状态查询购物车列表数据
function findCarts(){
    return axios.get("/cart/cartList");
}

//登录状态修改购物车，发送请求，把购物车修改后数据添加到服务器
function updateCart(params){
    return axios.put("/update/cart",params);
}

//登录状态删除购物车，发送请求，把购物车删除后数据添加到服务器
function dele(params){
    return axios.get("/delete",{params:params});
}

//发送请求，查询当前登录用户收货人地址
function findAddr(userId){
    return axios.get("/order/findAddr",{params:userId});
}
//定义方法，添加新的收货人地址
function saveAddress(params){

    return axios.post("/address/add",params);
}

function upateAddress(params){

    return axios.post("/address/update",params);
}

//查询地址
function getAddressListAll(){ 
    return axios.get("/address/findAll");
}

//查询地址
function getAddress(addressId){
    return axios.get("/address/findOne/"+addressId);
}
//删除地址
function delAddress(params){

    return axios.get("/address/delete/"+params);
}

//定义方法，提交订单
function createOrder(params){
    return axios.post("/order/createOrder",params);
}

//定义方法，完成支付
function pay(sn){
    return axios.get("/order/pay?sn="+sn);
}
//定时检查二维码支付状态，查询是否支付成功
function queryStatus(sn){
    return axios.get("/order_status",{params:sn});
}

//查询秒杀商品列表
function querySeckillGoods(){
    return axios.get("/seckill/goods");
}
