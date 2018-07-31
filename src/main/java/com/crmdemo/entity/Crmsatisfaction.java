package com.crmdemo.entity;


public class Crmsatisfaction {

  private Integer id;
  private Integer userId;
  private Integer satisfiStatus;
  private Integer satisfiReason;
  private String otherReason;
  private Integer disposeStatus;
  private java.sql.Timestamp updateTime;
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


  public Integer getSatisfiStatus() {
    return satisfiStatus;
  }

  public void setSatisfiStatus(Integer satisfiStatus) {
    this.satisfiStatus = satisfiStatus;
  }


  public Integer getSatisfiReason() {
    return satisfiReason;
  }

  public void setSatisfiReason(Integer satisfiReason) {
    this.satisfiReason = satisfiReason;
  }


  public String getOtherReason() {
    return otherReason;
  }

  public void setOtherReason(String otherReason) {
    this.otherReason = otherReason;
  }


  public Integer getDisposeStatus() {
    return disposeStatus;
  }

  public void setDisposeStatus(Integer disposeStatus) {
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
