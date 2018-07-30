package com.crmdemo.entity;


public class Crminvitation {

  private long invitationId;
  private long userId;
  private long invitationStatus;
  private java.sql.Timestamp updateTime;
  private java.sql.Timestamp createTime;


  public long getInvitationId() {
    return invitationId;
  }

  public void setInvitationId(long invitationId) {
    this.invitationId = invitationId;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public long getInvitationStatus() {
    return invitationStatus;
  }

  public void setInvitationStatus(long invitationStatus) {
    this.invitationStatus = invitationStatus;
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
