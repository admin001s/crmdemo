package com.crmdemo.entity;

import java.util.Date;

public class Crmmodular {

    private Integer crmModularId;
    private String crmProductServiceId;
    private String modularName;
    private Integer serialNumber;
    private Date updateTime;
    private Date createTime;
    private Integer i;


    public Integer getI() {
        return i;
    }

    public void setI(Integer i) {
        this.i = i;
    }

    public Integer getCrmModularId() {
        return crmModularId;
    }

    public void setCrmModularId(Integer crmModularId) {
        this.crmModularId = crmModularId;
    }


    public String getCrmProductServiceId() {
        return crmProductServiceId;
    }

    public void setCrmProductServiceId(String crmProductServiceId) {
        this.crmProductServiceId = crmProductServiceId;
    }


    public String getModularName() {
        return modularName;
    }

    public void setModularName(String modularName) {
        this.modularName = modularName;
    }


    public Integer getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(Integer serialNumber) {
        this.serialNumber = serialNumber;
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
