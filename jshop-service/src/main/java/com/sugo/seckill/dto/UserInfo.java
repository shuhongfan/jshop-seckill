package com.sugo.seckill.dto;


public class UserInfo {

    public UserInfo() {
    }

    public UserInfo(Integer id, String username) {
        this.id = id;
        this.username = username;
    }

    private Integer id;

    private String username;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}