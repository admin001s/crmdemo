package com.crmdemo.entity;


import java.security.Timestamp;
import java.util.Date;

public class Openservice {

  private Integer cashierId;
  private Integer userId;
  private Integer isopen;
  private String crmcustomersinfoid;
  private String openserviceTypeid;
  private Date createDate;
  private Date updateDate;
  private Integer deleteStatus;
  private String customerservice;
  private Integer i;

  public void setUpdateDate(Date updateDate) {
    this.updateDate = updateDate;
  }

  public String getCustomerservice() {
    return customerservice;
  }

  public void setCustomerservice(String customerservice) {
    this.customerservice = customerservice;
  }

  public Integer getI() {
    return i;
  }

  public void setI(Integer i) {
    this.i = i;
  }

  public Integer getCashierId() {
    return cashierId;
  }

  public void setCashierId(Integer cashierId) {
    this.cashierId = cashierId;
  }


  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }


  public Integer getIsopen() {
    return isopen;
  }

  public void setIsopen(Integer isopen) {
    this.isopen = isopen;
  }


  public String getCrmcustomersinfoid() {
    return crmcustomersinfoid;
  }

  public void setCrmcustomersinfoid(String crmcustomersinfoid) {
    this.crmcustomersinfoid = crmcustomersinfoid;
  }


  public String getOpenserviceTypeid() {
    return openserviceTypeid;
  }

  public void setOpenserviceTypeid(String openserviceTypeid) {
    this.openserviceTypeid = openserviceTypeid;
  }





  public Date getCreateDate() {
    return createDate;
  }

  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }


  public Date getUpdateDate() {
    return updateDate;
  }

  public void setUpdateDate(java.sql.Timestamp updateDate) {
    this.updateDate = updateDate;
  }


  public Integer getDeleteStatus() {
    return deleteStatus;
  }

  public void setDeleteStatus(Integer deleteStatus) {
    this.deleteStatus = deleteStatus;
  }

}
