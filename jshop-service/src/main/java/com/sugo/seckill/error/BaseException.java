package com.sugo.seckill.error;



//包装器业务异常类实现
public class BaseException extends Exception {

    private String msg;
    private int code;

    //接收自定义errMsg的方式构造业务异常
    public BaseException(int code, String errMsg){
        super();
        this.code = code;
        this.msg = errMsg;
    }


    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}
