package com.crmdemo.entity;


public class Crmcustomerallocate {

  private Integer id;
  private Integer userId;
  private Integer beiuserId;
  private java.sql.Timestamp distributionTime;
  private java.sql.Timestamp createTime;


  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }


  public Integer getBeiuserId() {
    return beiuserId;
  }

  public void setBeiuserId(Integer beiuserId) {
    this.beiuserId = beiuserId;
  }


  public java.sql.Timestamp getDistributionTime() {
    return distributionTime;
  }

  public void setDistributionTime(java.sql.Timestamp distributionTime) {
    this.distributionTime = distributionTime;
  }


  public java.sql.Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.sql.Timestamp createTime) {
    this.createTime = createTime;
  }

}
