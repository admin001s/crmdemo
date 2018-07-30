package com.sample;


public class Crmsatisfaction {

  private long id;
  private long userId;
  private long satisfiStatus;
  private long satisfiReason;
  private String otherReason;
  private long disposeStatus;
  private java.sql.Timestamp updateTime;
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


  public long getSatisfiStatus() {
    return satisfiStatus;
  }

  public void setSatisfiStatus(long satisfiStatus) {
    this.satisfiStatus = satisfiStatus;
  }


  public long getSatisfiReason() {
    return satisfiReason;
  }

  public void setSatisfiReason(long satisfiReason) {
    this.satisfiReason = satisfiReason;
  }


  public String getOtherReason() {
    return otherReason;
  }

  public void setOtherReason(String otherReason) {
    this.otherReason = otherReason;
  }


  public long getDisposeStatus() {
    return disposeStatus;
  }

  public void setDisposeStatus(long disposeStatus) {
    this.disposeStatus = disposeStatus;
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
