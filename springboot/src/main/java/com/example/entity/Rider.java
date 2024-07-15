package com.example.entity;

import java.io.Serializable;

/**
 * 骑手表
 */
public class Rider implements Serializable {
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;
    /** 账号 */
    private String riderAccount;
    /** 密码 */
    private String riderPassword;
    /** 姓名 */
    private String riderName;
    /** 电话 */
    private String phone;
    /** 车辆 */
    private String vehicle;
    /** 状态 */
    private String status;
    /** 头像 */
    private String avatar;

    private String token;

// Getters and Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRiderAccount() {
        return riderAccount;
    }

    public void setRiderAccount(String riderAccount) {
        this.riderAccount = riderAccount;
    }

    public String getRiderPassword() {
        return riderPassword;
    }

    public void setRiderPassword(String riderPassword) {
        this.riderPassword = riderPassword;
    }

    public String getRiderName() {
        return riderName;
    }

    public void setRiderName(String riderName) {
        this.riderName = riderName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getVehicle() {
        return vehicle;
    }

    public void setVehicle(String vehicle) {
        this.vehicle = vehicle;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}