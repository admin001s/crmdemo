package com.crmdemo.entity;


public class Crmcustomerdetails {

  private Integer id;
  private Integer crmcustomersinfoId;
  private String chatrecord;
  private String customername;
  private Integer followupId;
  private Integer followupStatus;
  private java.sql.Timestamp followupTime;
  private java.sql.Timestamp createTime;


  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public Integer getCrmcustomersinfoId() {
    return crmcustomersinfoId;
  }

  public void setCrmcustomersinfoId(Integer crmcustomersinfoId) {
    this.crmcustomersinfoId = crmcustomersinfoId;
  }


  public String getChatrecord() {
    return chatrecord;
  }

  public void setChatrecord(String chatrecord) {
    this.chatrecord = chatrecord;
  }


  public String getCustomername() {
    return customername;
  }

  public void setCustomername(String customername) {
    this.customername = customername;
  }


  public Integer getFollowupId() {
    return followupId;
  }

  public void setFollowupId(Integer followupId) {
    this.followupId = followupId;
  }


  public Integer getFollowupStatus() {
    return followupStatus;
  }

  public void setFollowupStatus(Integer followupStatus) {
    this.followupStatus = followupStatus;
  }


  public java.sql.Timestamp getFollowupTime() {
    return followupTime;
  }

  public void setFollowupTime(java.sql.Timestamp followupTime) {
    this.followupTime = followupTime;
  }


  public java.sql.Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.sql.Timestamp createTime) {
    this.createTime = createTime;
  }

}
