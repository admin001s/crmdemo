package com.crmdemo.entity;


import com.crmdemo.util.DateUtil;

import java.sql.Date;
import java.sql.Timestamp;

public class Crmcustomersinfo {

  private Integer id;
  private String customersId;
  private String customersName;
  private String customersSex;
  private Integer provinceId;
  private String provinceName;
  private String cityName;
  private String countryName;
  private String department;
  private String mainsalesarea;
  private String mobilephone;
  private String telephone;
  private String qq;
  private Integer isVip;
  private String email;
  private String fax;
  private String industryCategory;
  private String industrySubclass;
  private String customerSource;
  private String customerUrlSource;
  private String companywebsite;
  private String companyAddress;
  private String companydetails;
  private Integer customerStatus;
  private String mainproducts;
  private Integer adduserId;
  private String adduserHierarchy;
  private Integer deleteStatus;
  private String addmethod;
  private java.sql.Timestamp createTime;
  private java.sql.Timestamp updateTime;
  private java.sql.Date beOverdue;
  private  Integer level;
  private Integer readingState;

  public Integer getReadingState() {
    return readingState;
  }

  public void setReadingState(Integer readingState) {
    this.readingState = readingState;
  }

  public Integer getLevel() {
    return level;
  }

  public void setLevel(Integer level) {
    this.level = level;
  }

  public Date getBeOverdue() {
    return beOverdue;
  }

  public void setBeOverdue(Date beOverdue) {
    this.beOverdue = beOverdue;
  }

  //另外加的字段
  private Integer i;  //序号



  public Integer getI() {
    return i;
  }

  public void setI(Integer i) {
    this.i = i;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public String getCustomersId() {
    return customersId;
  }

  public void setCustomersId(String customersId) {
    this.customersId = customersId;
  }

  public String getCustomersName() {
    return customersName;
  }

  public void setCustomersName(String customersName) {
    this.customersName = customersName;
  }


  public String getCustomersSex() {
    return customersSex;
  }

  public void setCustomersSex(String customersSex) {
    this.customersSex = customersSex;
  }


  public Integer getProvinceId() {
    return provinceId;
  }

  public void setProvinceId(Integer provinceId) {
    this.provinceId = provinceId;
  }


  public String getProvinceName() {
    return provinceName;
  }

  public void setProvinceName(String provinceName) {
    this.provinceName = provinceName;
  }


  public String getCityName() {
    return cityName;
  }

  public void setCityName(String cityName) {
    this.cityName = cityName;
  }


  public String getCountryName() {
    return countryName;
  }

  public void setCountryName(String countryName) {
    this.countryName = countryName;
  }


  public String getDepartment() {
    return department;
  }

  public void setDepartment(String department) {
    this.department = department;
  }


  public String getMainsalesarea() {
    return mainsalesarea;
  }

  public void setMainsalesarea(String mainsalesarea) {
    this.mainsalesarea = mainsalesarea;
  }


  public String getMobilephone() {
    return mobilephone;
  }

  public void setMobilephone(String mobilephone) {
    this.mobilephone = mobilephone;
  }


  public String getTelephone() {
    return telephone;
  }

  public void setTelephone(String telephone) {
    this.telephone = telephone;
  }


  public String getQq() {
    return qq;
  }

  public void setQq(String qq) {
    this.qq = qq;
  }


  public Integer getIsVip() {
    return isVip;
  }

  public void setIsVip(Integer isVip) {
    this.isVip = isVip;
  }


  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }


  public String getFax() {
    return fax;
  }

  public void setFax(String fax) {
    this.fax = fax;
  }


  public String getIndustryCategory() {
    return industryCategory;
  }

  public void setIndustryCategory(String industryCategory) {
    this.industryCategory = industryCategory;
  }


  public String getIndustrySubclass() {
    return industrySubclass;
  }

  public void setIndustrySubclass(String industrySubclass) {
    this.industrySubclass = industrySubclass;
  }


  public String getCustomerSource() {
    return customerSource;
  }

  public void setCustomerSource(String customerSource) {
    this.customerSource = customerSource;
  }


  public String getCustomerUrlSource() {
    return customerUrlSource;
  }

  public void setCustomerUrlSource(String customerUrlSource) {
    this.customerUrlSource = customerUrlSource;
  }


  public String getCompanywebsite() {
    return companywebsite;
  }

  public void setCompanywebsite(String companywebsite) {
    this.companywebsite = companywebsite;
  }


  public String getCompanyAddress() {
    return companyAddress;
  }

  public void setCompanyAddress(String companyAddress) {
    this.companyAddress = companyAddress;
  }


  public String getCompanydetails() {
    return companydetails;
  }

  public void setCompanydetails(String companydetails) {
    this.companydetails = companydetails;
  }


  public Integer getCustomerStatus() {
    return customerStatus;
  }

  public void setCustomerStatus(Integer customerStatus) {
    this.customerStatus = customerStatus;
  }

  public String getMainproducts() {
    return mainproducts;
  }

  public void setMainproducts(String mainproducts) {
    this.mainproducts = mainproducts;
  }


  public Integer getAdduserId() {
    return adduserId;
  }

  public void setAdduserId(Integer adduserId) {
    this.adduserId = adduserId;
  }


  public String getAdduserHierarchy() {
    return adduserHierarchy;
  }

  public void setAdduserHierarchy(String adduserHierarchy) {
    this.adduserHierarchy = adduserHierarchy;
  }


  public Integer getDeleteStatus() {
    return deleteStatus;
  }

  public void setDeleteStatus(Integer deleteStatus) {
    this.deleteStatus = deleteStatus;
  }


  public String getAddmethod() {
    return addmethod;
  }

  public void setAddmethod(String addmethod) {
    this.addmethod = addmethod;
  }


//  public String getCreateTime() {
//    return DateUtil.dateToStr(createTime);
//  }
//
//  public void setCreateTime(java.sql.Timestamp createTime) {
//    this.createTime = createTime;
//  }


  public String getUpdateTime() {
    return DateUtil.dateToStr(updateTime);
  }

  public void setUpdateTime(java.sql.Timestamp updateTime) {
    this.updateTime = updateTime;
  }

  public String getCreateTime() {
    return DateUtil.dateToStr(createTime);
  }

  public void setCreateTime(Timestamp createTime) {
    this.createTime = createTime;
  }
}
