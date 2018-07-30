package com.sample;


public class Crmcustomerorder {

  private long id;
  private long customersId;
  private long signingfollowupId;
  private String followupHierarchy;
  private long signingStatus;
  private java.sql.Timestamp signingTime;
  private long reviewerId;
  private String reviewerLevel;
  private long isdelete;
  private long signingtypeId;
  private java.sql.Timestamp yesSigningTime;
  private java.sql.Timestamp createTime;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getCustomersId() {
    return customersId;
  }

  public void setCustomersId(long customersId) {
    this.customersId = customersId;
  }


  public long getSigningfollowupId() {
    return signingfollowupId;
  }

  public void setSigningfollowupId(long signingfollowupId) {
    this.signingfollowupId = signingfollowupId;
  }


  public String getFollowupHierarchy() {
    return followupHierarchy;
  }

  public void setFollowupHierarchy(String followupHierarchy) {
    this.followupHierarchy = followupHierarchy;
  }


  public long getSigningStatus() {
    return signingStatus;
  }

  public void setSigningStatus(long signingStatus) {
    this.signingStatus = signingStatus;
  }


  public java.sql.Timestamp getSigningTime() {
    return signingTime;
  }

  public void setSigningTime(java.sql.Timestamp signingTime) {
    this.signingTime = signingTime;
  }


  public long getReviewerId() {
    return reviewerId;
  }

  public void setReviewerId(long reviewerId) {
    this.reviewerId = reviewerId;
  }


  public String getReviewerLevel() {
    return reviewerLevel;
  }

  public void setReviewerLevel(String reviewerLevel) {
    this.reviewerLevel = reviewerLevel;
  }


  public long getIsdelete() {
    return isdelete;
  }

  public void setIsdelete(long isdelete) {
    this.isdelete = isdelete;
  }


  public long getSigningtypeId() {
    return signingtypeId;
  }

  public void setSigningtypeId(long signingtypeId) {
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
