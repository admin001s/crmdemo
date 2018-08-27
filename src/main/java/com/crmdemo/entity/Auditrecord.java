package com.crmdemo.entity;

import com.crmdemo.util.DateUtil;

import java.sql.Timestamp;

public class Auditrecord {
    private Integer recordId;
    private Integer orderId;
    private Integer recotdStatus;
    private Integer userId;
    private java.sql.Timestamp createdate;

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getRecotdStatus() {
        return recotdStatus;
    }

    public void setRecotdStatus(Integer recotdStatus) {
        this.recotdStatus = recotdStatus;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getCreatedate() {
        return DateUtil.dateToStr(createdate);
    }

    public void setCreatedate(Timestamp createdate) {
        this.createdate = createdate;
    }
}
