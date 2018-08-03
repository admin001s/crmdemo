package com.crmdemo.entity;


public class Crmproductservice {

  private Integer crmProductServiceId;
  private String name;
  private String detail;
  private java.sql.Timestamp updateTime;
  private java.sql.Timestamp createTime;


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
