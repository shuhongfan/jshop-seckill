package com.sugo.seckill.dto;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;

public class MessageInfo implements Serializable {

    //1:审核，2：增加，3：删除
    private int method;

    //发送的消息内容
    private Object content;


    //设置主题
    @JSONField(serialize = false)
    private String topic;

    //设置标签
    @JSONField(serialize = false)
    private String tags;

    //设置keys
    @JSONField(serialize = false)
    private String keys;

    public MessageInfo(String topic, String tags, String keys) {
        this.topic = topic;
        this.tags = tags;
        this.keys = keys;
    }

    public MessageInfo(int method, Object content, String topic, String tags, String keys) {
        this.method = method;
        this.content = content;
        this.topic = topic;
        this.tags = tags;
        this.keys = keys;
    }

    public MessageInfo(int method, Object content) {
        this.method = method;
        this.content = content;
    }

    public MessageInfo() {
    }

    public int getMethod() {
        return method;
    }

    public void setMethod(int method) {
        this.method = method;
    }

    public Object getContent() {
        return content;
    }

    public void setContent(Object content) {
        this.content = content;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getKeys() {
        return keys;
    }

    public void setKeys(String keys) {
        this.keys = keys;
    }
}
