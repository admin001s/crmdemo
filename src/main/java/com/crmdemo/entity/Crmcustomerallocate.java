package com.sample;


public class Crmcustomerallocate {

  private long id;
  private long userId;
  private long beiuserId;
  private java.sql.Timestamp distributionTime;
  private java.sql.Timestamp createTime;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public long getBeiuserId() {
    return beiuserId;
  }

  public void setBeiuserId(long beiuserId) {
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
