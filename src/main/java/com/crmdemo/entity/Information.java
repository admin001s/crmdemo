package com.crmdemo.entity;


import com.crmdemo.util.DateUtil;

import java.sql.Timestamp;

public class Information {

    private Integer mationId;
    private Integer userId;
    private String title;
    private Integer mationStatus;
    private java.sql.Timestamp createTime;
    private Integer customerId;

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Integer getMationId() {
        return mationId;
    }

    public void setMationId(Integer mationId) {
        this.mationId = mationId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getMationStatus() {
        return mationStatus;
    }

    public void setMationStatus(Integer mationStatus) {
        this.mationStatus = mationStatus;
    }

    public String getCreateTime() {
        return DateUtil.dateToStr(createTime);
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
}
