package com.crmdemo.entity;


public class Openservice {

  private long cashierId;
  private long userId;
  private long isopen;
  private long crmcustomersinfoid;
  private long openserviceTypeid;
  private String cashierRemark;
  private java.sql.Timestamp createDate;
  private java.sql.Timestamp updateDate;
  private long deleteStatus;


  public long getCashierId() {
    return cashierId;
  }

  public void setCashierId(long cashierId) {
    this.cashierId = cashierId;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public long getIsopen() {
    return isopen;
  }

  public void setIsopen(long isopen) {
    this.isopen = isopen;
  }


  public long getCrmcustomersinfoid() {
    return crmcustomersinfoid;
  }

  public void setCrmcustomersinfoid(long crmcustomersinfoid) {
    this.crmcustomersinfoid = crmcustomersinfoid;
  }


  public long getOpenserviceTypeid() {
    return openserviceTypeid;
  }

  public void setOpenserviceTypeid(long openserviceTypeid) {
    this.openserviceTypeid = openserviceTypeid;
  }


  public String getCashierRemark() {
    return cashierRemark;
  }

  public void setCashierRemark(String cashierRemark) {
    this.cashierRemark = cashierRemark;
  }


  public java.sql.Timestamp getCreateDate() {
    return createDate;
  }

  public void setCreateDate(java.sql.Timestamp createDate) {
    this.createDate = createDate;
  }


  public java.sql.Timestamp getUpdateDate() {
    return updateDate;
  }

  public void setUpdateDate(java.sql.Timestamp updateDate) {
    this.updateDate = updateDate;
  }


  public long getDeleteStatus() {
    return deleteStatus;
  }

  public void setDeleteStatus(long deleteStatus) {
    this.deleteStatus = deleteStatus;
  }

}
