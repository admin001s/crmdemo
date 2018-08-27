package com.crmdemo.entity;


import java.sql.Date;
import java.sql.Timestamp;

public class Crmcustomerallocate {

  private Integer id;
  private Integer userId;
  private Integer beiuserId;
  private java.sql.Timestamp distributionTime;
  private java.sql.Timestamp createTime;
  private Integer customerId;
  private java.sql.Timestamp updateTime;
  private Integer isRelation;
  private java.sql.Date distributionDate;

  public Date getDistributionDate() {
    return distributionDate;
  }

  public void setDistributionDate(Date distributionDate) {
    this.distributionDate = distributionDate;
  }

  public Integer getIsRelation() {
    return isRelation;
  }

  public void setIsRelation(Integer isRelation) {
    this.isRelation = isRelation;
  }

  public Integer getCustomerId() {
    return customerId;
  }

  public void setCustomerId(Integer customerId) {
    this.customerId = customerId;
  }

  public Timestamp getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(Timestamp updateTime) {
    this.updateTime = updateTime;
  }

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
