package com.crmdemo.entity;


public class Crmquestionanswers {

  private Integer id;
  private Integer replyType;
  private Integer replyFatherId;
  private String replycontent;
  private String replyuserleveid;
  private String questiuserleveid;
  private java.sql.Timestamp createTime;
  private Integer replyuserId;


  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public Integer getReplyType() {
    return replyType;
  }

  public void setReplyType(Integer replyType) {
    this.replyType = replyType;
  }


  public Integer getReplyFatherId() {
    return replyFatherId;
  }

  public void setReplyFatherId(Integer replyFatherId) {
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


  public Integer getReplyuserId() {
    return replyuserId;
  }

  public void setReplyuserId(Integer replyuserId) {
    this.replyuserId = replyuserId;
  }

}
