package com.crmdemo.entity;


public class Crmquestions {

  private long id;
  private long questionsType;
  private String questiontitle;
  private String questioncontent;
  private long questiuserid;
  private long questiuserleveid;
  private java.sql.Timestamp createTime;
  private long responsesNum;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getQuestionsType() {
    return questionsType;
  }

  public void setQuestionsType(long questionsType) {
    this.questionsType = questionsType;
  }


  public String getQuestiontitle() {
    return questiontitle;
  }

  public void setQuestiontitle(String questiontitle) {
    this.questiontitle = questiontitle;
  }


  public String getQuestioncontent() {
    return questioncontent;
  }

  public void setQuestioncontent(String questioncontent) {
    this.questioncontent = questioncontent;
  }


  public long getQuestiuserid() {
    return questiuserid;
  }

  public void setQuestiuserid(long questiuserid) {
    this.questiuserid = questiuserid;
  }


  public long getQuestiuserleveid() {
    return questiuserleveid;
  }

  public void setQuestiuserleveid(long questiuserleveid) {
    this.questiuserleveid = questiuserleveid;
  }


  public java.sql.Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.sql.Timestamp createTime) {
    this.createTime = createTime;
  }


  public long getResponsesNum() {
    return responsesNum;
  }

  public void setResponsesNum(long responsesNum) {
    this.responsesNum = responsesNum;
  }

}
