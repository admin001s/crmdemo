package com.crmdemo.vop;

import java.sql.Timestamp;

public class Responsible {
    private String responsible;
    private String toresponsible;
    private java.sql.Timestamp createTime;

    public String getResponsible() {
        return responsible;
    }

    public void setResponsible(String responsible) {
        this.responsible = responsible;
    }

    public String getToresponsible() {
        return toresponsible;
    }

    public void setToresponsible(String toresponsible) {
        this.toresponsible = toresponsible;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
}
