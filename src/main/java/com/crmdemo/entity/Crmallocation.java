package com.crmdemo.entity;


public class Crmallocation {

  private Integer crmAllocationId;
  private Integer openserviceId;
  private Integer userId;
  private Integer allocationStatus;
  private String levelRelationShip;
  private Integer interiorOutsideId;
  private java.sql.Timestamp updateTime;
  private java.sql.Timestamp createTime;


  public Integer getCrmAllocationId() {
    return crmAllocationId;
  }

  public void setCrmAllocationId(Integer crmAllocationId) {
    this.crmAllocationId = crmAllocationId;
  }


  public Integer getOpenserviceId() {
    return openserviceId;
  }

  public void setOpenserviceId(Integer openserviceId) {
    this.openserviceId = openserviceId;
  }


  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }


  public Integer getAllocationStatus() {
    return allocationStatus;
  }

  public void setAllocationStatus(Integer allocationStatus) {
    this.allocationStatus = allocationStatus;
  }


  public String getLevelRelationShip() {
    return levelRelationShip;
  }

  public void setLevelRelationShip(String levelRelationShip) {
    this.levelRelationShip = levelRelationShip;
  }


  public Integer getInteriorOutsideId() {
    return interiorOutsideId;
  }

  public void setInteriorOutsideId(Integer interiorOutsideId) {
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
