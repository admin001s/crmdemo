package com.sample;


public class Crmallocation {

  private long crmAllocationId;
  private long openserviceId;
  private long userId;
  private long allocationStatus;
  private String levelRelationShip;
  private long interiorOutsideId;
  private java.sql.Timestamp updateTime;
  private java.sql.Timestamp createTime;


  public long getCrmAllocationId() {
    return crmAllocationId;
  }

  public void setCrmAllocationId(long crmAllocationId) {
    this.crmAllocationId = crmAllocationId;
  }


  public long getOpenserviceId() {
    return openserviceId;
  }

  public void setOpenserviceId(long openserviceId) {
    this.openserviceId = openserviceId;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public long getAllocationStatus() {
    return allocationStatus;
  }

  public void setAllocationStatus(long allocationStatus) {
    this.allocationStatus = allocationStatus;
  }


  public String getLevelRelationShip() {
    return levelRelationShip;
  }

  public void setLevelRelationShip(String levelRelationShip) {
    this.levelRelationShip = levelRelationShip;
  }


  public long getInteriorOutsideId() {
    return interiorOutsideId;
  }

  public void setInteriorOutsideId(long interiorOutsideId) {
    this.interiorOutsideId = interiorOutsideId;
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
