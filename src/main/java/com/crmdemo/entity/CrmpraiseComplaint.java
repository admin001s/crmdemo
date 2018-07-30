package com.crmdemo.entity;


public class CrmpraiseComplaint {

  private long id;
  private long userId;
  private long complaintStatus;
  private long complaintReason;
  private String otherReason;
  private long disposeStatus;
  private java.sql.Timestamp disposeTime;
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


  public long getComplaintStatus() {
    return complaintStatus;
  }

  public void setComplaintStatus(long complaintStatus) {
    this.complaintStatus = complaintStatus;
  }


  public long getComplaintReason() {
    return complaintReason;
  }

  public void setComplaintReason(long complaintReason) {
    this.complaintReason = complaintReason;
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


  public java.sql.Timestamp getDisposeTime() {
    return disposeTime;
  }

  public void setDisposeTime(java.sql.Timestamp disposeTime) {
    this.disposeTime = disposeTime;
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
