package com.sample;


public class Crmquestionanswers {

  private long id;
  private long replyType;
  private long replyFatherId;
  private String replycontent;
  private String replyuserleveid;
  private String questiuserleveid;
  private java.sql.Timestamp createTime;
  private long replyuserId;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getReplyType() {
    return replyType;
  }

  public void setReplyType(long replyType) {
    this.replyType = replyType;
  }


  public long getReplyFatherId() {
    return replyFatherId;
  }

  public void setReplyFatherId(long replyFatherId) {
    this.replyFatherId = replyFatherId;
  }


  public String getReplycontent() {
    return replycontent;
  }

  public void setReplycontent(String replycontent) {
    this.replycontent = replycontent;
  }


  public String getReplyuserleveid() {
    return replyuserleveid;
  }

  public void setReplyuserleveid(String replyuserleveid) {
    this.replyuserleveid = replyuserleveid;
  }


  public String getQuestiuserleveid() {
    return questiuserleveid;
  }

  public void setQuestiuserleveid(String questiuserleveid) {
    this.questiuserleveid = questiuserleveid;
  }


  public java.sql.Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.sql.Timestamp createTime) {
    this.createTime = createTime;
  }


  public long getReplyuserId() {
    return replyuserId;
  }

  public void setReplyuserId(long replyuserId) {
    this.replyuserId = replyuserId;
  }

}
