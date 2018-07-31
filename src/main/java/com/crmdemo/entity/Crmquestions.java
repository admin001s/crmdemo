package com.crmdemo.entity;


public class Crmquestions {

  private Integer id;
  private Integer questionsType;
  private String questiontitle;
  private String questioncontent;
  private Integer questiuserid;
  private Integer questiuserleveid;
  private java.sql.Timestamp createTime;
  private Integer responsesNum;


  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public Integer getQuestionsType() {
    return questionsType;
  }

  public void setQuestionsType(Integer questionsType) {
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


  public Integer getQuestiuserid() {
    return questiuserid;
  }

  public void setQuestiuserid(Integer questiuserid) {
    this.questiuserid = questiuserid;
  }


  public Integer getQuestiuserleveid() {
    return questiuserleveid;
  }

  public void setQuestiuserleveid(Integer questiuserleveid) {
    this.questiuserleveid = questiuserleveid;
  }


  public java.sql.Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.sql.Timestamp createTime) {
    this.createTime = createTime;
  }


  public Integer getResponsesNum() {
    return responsesNum;
  }

  public void setResponsesNum(Integer responsesNum) {
    this.responsesNum = responsesNum;
  }

}
