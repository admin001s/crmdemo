package com.sample;


public class Crmcustomerdetails {

  private long id;
  private long crmcustomersinfoId;
  private String chatrecord;
  private String customername;
  private long followupId;
  private long followupStatus;
  private java.sql.Timestamp followupTime;
  private java.sql.Timestamp createTime;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getCrmcustomersinfoId() {
    return crmcustomersinfoId;
  }

  public void setCrmcustomersinfoId(long crmcustomersinfoId) {
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


  public long getFollowupId() {
    return followupId;
  }

  public void setFollowupId(long followupId) {
    this.followupId = followupId;
  }


  public long getFollowupStatus() {
    return followupStatus;
  }

  public void setFollowupStatus(long followupStatus) {
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
