package com.crmdemo.entity;


import java.util.Date;

public class Crmproductservice {

    private Integer crmProductServiceId;
    private String name;
    private String detail;
    private Date updateTime;
    private Date createTime;
    private Integer i;

    public Integer getI() {
        return i;
    }

    public void setI(Integer i) {
        this.i = i;
    }

    public Integer getCrmProductServiceId() {
        return crmProductServiceId;
    }

    public void setCrmProductServiceId(Integer crmProductServiceId) {
        this.crmProductServiceId = crmProductServiceId;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }


    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }


    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}
