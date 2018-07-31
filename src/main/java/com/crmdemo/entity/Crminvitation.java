package com.crmdemo.entity;


public class Crminvitation {

  private Integer invitationId;
  private Integer userId;
  private Integer invitationStatus;
  private java.sql.Timestamp updateTime;
  private java.sql.Timestamp createTime;


  public Integer getInvitationId() {
    return invitationId;
  }

  public void setInvitationId(Integer invitationId) {
    this.invitationId = invitationId;
  }


  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }


  public Integer getInvitationStatus() {
    return invitationStatus;
  }

  public void setInvitationStatus(Integer invitationStatus) {
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
