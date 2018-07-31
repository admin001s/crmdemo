package com.crmdemo.entity;


public class CrmpraiseComplaint {

  private Integer id;
  private Integer userId;
  private Integer complaintStatus;
  private Integer complaintReason;
  private String otherReason;
  private Integer disposeStatus;
  private java.sql.Timestamp disposeTime;
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


  public Integer getComplaintStatus() {
    return complaintStatus;
  }

  public void setComplaintStatus(Integer complaintStatus) {
    this.complaintStatus = complaintStatus;
  }


  public Integer getComplaintReason() {
    return complaintReason;
  }

  public void setComplaintReason(Integer complaintReason) {
    this.complaintReason = complaintReason;
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
