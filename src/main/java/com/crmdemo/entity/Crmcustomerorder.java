package com.crmdemo.entity;


public class Crmcustomerorder {

  private Integer id;
  private Integer customersId;
  private Integer signingfollowupId;
  private String followupHierarchy;
  private Integer signingStatus;
  private java.sql.Timestamp signingTime;
  private Integer reviewerId;
  private String reviewerLevel;
  private Integer isdelete;
  private Integer signingtypeId;
  private java.sql.Timestamp yesSigningTime;
  private java.sql.Timestamp createTime;


  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public Integer getCustomersId() {
    return customersId;
  }

  public void setCustomersId(Integer customersId) {
    this.customersId = customersId;
  }


  public Integer getSigningfollowupId() {
    return signingfollowupId;
  }

  public void setSigningfollowupId(Integer signingfollowupId) {
    this.signingfollowupId = signingfollowupId;
  }


  public String getFollowupHierarchy() {
    return followupHierarchy;
  }

  public void setFollowupHierarchy(String followupHierarchy) {
    this.followupHierarchy = followupHierarchy;
  }


  public Integer getSigningStatus() {
    return signingStatus;
  }

  public void setSigningStatus(Integer signingStatus) {
    this.signingStatus = signingStatus;
  }


  public java.sql.Timestamp getSigningTime() {
    return signingTime;
  }

  public void setSigningTime(java.sql.Timestamp signingTime) {
    this.signingTime = signingTime;
  }


  public Integer getReviewerId() {
    return reviewerId;
  }

  public void setReviewerId(Integer reviewerId) {
    this.reviewerId = reviewerId;
  }


  public String getReviewerLevel() {
    return reviewerLevel;
  }

  public void setReviewerLevel(String reviewerLevel) {
    this.reviewerLevel = reviewerLevel;
  }


  public Integer getIsdelete() {
    return isdelete;
  }

  public void setIsdelete(Integer isdelete) {
    this.isdelete = isdelete;
  }


  public Integer getSigningtypeId() {
    return signingtypeId;
  }

  public void setSigningtypeId(Integer signingtypeId) {
    this.signingtypeId = signingtypeId;
  }


  public java.sql.Timestamp getYesSigningTime() {
    return yesSigningTime;
  }

  public void setYesSigningTime(java.sql.Timestamp yesSigningTime) {
    this.yesSigningTime = yesSigningTime;
  }


  public java.sql.Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.sql.Timestamp createTime) {
    this.createTime = createTime;
  }

}
