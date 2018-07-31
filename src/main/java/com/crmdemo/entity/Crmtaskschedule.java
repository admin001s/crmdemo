package com.crmdemo.entity;


public class Crmtaskschedule {

  private Integer crmTaskScheduleId;
  private Integer rmProductServiceCId;
  private Integer crmModularId;
  private Integer userId;
  private java.sql.Timestamp serviceTime;
  private String levelRelationShip;
  private Integer status;
  private String existQuest;
  private java.sql.Timestamp confirmTime;
  private Integer confirmUserId;
  private java.sql.Timestamp updateTime;
  private java.sql.Timestamp createTime;


  public Integer getCrmTaskScheduleId() {
    return crmTaskScheduleId;
  }

  public void setCrmTaskScheduleId(Integer crmTaskScheduleId) {
    this.crmTaskScheduleId = crmTaskScheduleId;
  }


  public Integer getRmProductServiceCId() {
    return rmProductServiceCId;
  }

  public void setRmProductServiceCId(Integer rmProductServiceCId) {
    this.rmProductServiceCId = rmProductServiceCId;
  }


  public Integer getCrmModularId() {
    return crmModularId;
  }

  public void setCrmModularId(Integer crmModularId) {
    this.crmModularId = crmModularId;
  }


  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }


  public java.sql.Timestamp getServiceTime() {
    return serviceTime;
  }

  public void setServiceTime(java.sql.Timestamp serviceTime) {
    this.serviceTime = serviceTime;
  }


  public String getLevelRelationShip() {
    return levelRelationShip;
  }

  public void setLevelRelationShip(String levelRelationShip) {
    this.levelRelationShip = levelRelationShip;
  }


  public Integer getStatus() {
    return status;
  }

  public void setStatus(Integer status) {
    this.status = status;
  }


  public String getExistQuest() {
    return existQuest;
  }

  public void setExistQuest(String existQuest) {
    this.existQuest = existQuest;
  }


  public java.sql.Timestamp getConfirmTime() {
    return confirmTime;
  }

  public void setConfirmTime(java.sql.Timestamp confirmTime) {
    this.confirmTime = confirmTime;
  }


  public Integer getConfirmUserId() {
    return confirmUserId;
  }

  public void setConfirmUserId(Integer confirmUserId) {
    this.confirmUserId = confirmUserId;
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
