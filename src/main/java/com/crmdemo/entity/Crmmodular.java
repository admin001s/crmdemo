package com.crmdemo.entity;

public class Crmmodular {

  private long crmModularId;
  private String crmProductServiceId;
  private String modularName;
  private long serialNumber;
  private java.sql.Timestamp updateTime;
  private java.sql.Timestamp createTime;


  public long getCrmModularId() {
    return crmModularId;
  }

  public void setCrmModularId(long crmModularId) {
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


  public long getSerialNumber() {
    return serialNumber;
  }

  public void setSerialNumber(long serialNumber) {
    this.serialNumber = serialNumber;
  }


  public java.sql.Timestamp getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(java.sql.Timestamp updateTime) {
    this.updateTime = updateTime;
  }


  public java.sql.Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.sql.Timestamp createTime) {
    this.createTime = createTime;
  }

}
