package com.sugo.seckill.http;

import java.io.Serializable;

public class Error implements Serializable {
    private String  field;
    private Integer id;
    private String msg;
    private Integer vmId=1;

    public Error() {
    }

    /**
     * @Description: 方法描述
     * @Author: hubin
     * @CreateDate: 2020/5/25 17:14
     * @UpdateUser: hubin
     * @UpdateDate: 2020/5/25 17:14
     * @UpdateRemark: 修改内容
     * @Version: 1.0
     */
    public Error(String field, Integer id, String msg) {
        this.field = field;
        this.id = id;
        this.msg = msg;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getVmId() {
        return vmId;
    }

    public void setVmId(Integer vmId) {
        this.vmId = vmId;
    }
}
