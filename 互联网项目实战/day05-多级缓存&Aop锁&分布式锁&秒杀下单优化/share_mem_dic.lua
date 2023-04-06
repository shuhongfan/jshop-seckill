local redis=require "resty.redis"

--获取redis对象
local red=redis:new()

--基于内存字典实现缓存
--添加缓存方法
function set_to_cache(key,value,expireTime)
    if not expireTime then
        expireTime=0
    end

    --获取本地内存字典对象
    local ngx_cache=ngx_shared.nax_cache

    --添加到本地内存字典数据
    local succ,err,forcible=ngx_cache:set(key,value,expireTime)
    return succ;
end

--获取内存字典中的数据
function get_from_cache(key)
    --获取本地内存字典对象
    local ngx_cache = ngx.shared.ngx_cache

    --从内存字典中获取数据
    local value=ngx_cache:get(key)

    --如果本地内存字典没有,就去redis中查询
    if not value then
        --从redis获取缓存数据
        local rev,err=get_to_redis(key)
        if not rev then
            ngx.say("redis cache not exists...",err)
            return
        end

        --将redis中查询到的数据保存到cache
        set_to_cache(key,rev,60)
    end

    return value;
end

--向redis中添加缓存数据
function set_to_redis(key,value)
    --设置redis超时时间
    red:set_timeout(1000000)

    --连接reids服务器
    local ok,err=red:connect("127.0.0.1",6379)

    --判断是否连接成功
    if not ok then
        --未连接成功,返回错误信息
        ngx.say("failed to connect:",err)
        return
    end

    --向redis添加缓存数据
    local ok,err=red:set(key,value)
    if not ok then
        --添加缓存失败
        ngx.say("failed set to redis:",err)
        return
    end

    --添加缓存数据成功
    return ok;
end

--从redis中获取缓存数据
function get_to_redis(key)
    --设置redis超时时间
    red:set_timeout(1000000)

    --连接redis服务器
    local ok,err=red:connect("127.0.0.1",6379)

    --判断是否连接成功
    if not ok then
        ngx.say("failed to connect:",err)
        return
    end

    --从redis获取缓存数据
    local ok,err = red:get(key)
    if not ok then
        ngx.say("failed set to redis:",err)
        return
    end

    --返回结果数据
    ngx.say("get cache from redis..............")
    return res;
end


--简单实现业务逻辑
--先从本地内存字典查询数据，如果本地内存字典没有，将会把请求转发给后端服务器，查询数据

--先获取请求参数
local params = ngx.req.get_uri_args()
local id=params.id

--先从本地内存字典查询数据
local goods = get_from_cache("seckill_goods_"..id)

--判断如果内存字典中没有数据，将会把请求转发给后端服务器
if goods==nil then
    --从数据库中查询数据
    local res=ngx.location.capture("/seckill/goods/detail"..id)
    goods=res.body

    --添加到本地内存字典数据
    set_to_cache("seckill_goods_"..id,goods,60)
end

--返回结果数据
ngx.say(goods)