package com.crmdemo.entity;


public class Crminfo {

  private Integer userId;
  private String userName;
  private String passWord;
  private Integer roleId;
  private String englishName;
  private String chineseName;
  private java.sql.Timestamp createTime;
  private java.sql.Timestamp updateTime;
  private String userArrangement;
  private Integer isavailable;
  private String userPath;
  private String pathVar;
  private String roleName;

  public String getRoleName() {
    return roleName;
  }

  public void setRoleName(String roleName) {
    this.roleName = roleName;
  }

  public String getUserPath() {
    return userPath;
  }

  public void setUserPath(String userPath) {
    this.userPath = userPath;
  }

  public String getPathVar() {
    return pathVar;
  }

  public void setPathVar(String pathVar) {
    this.pathVar = pathVar;
  }

  public Integer getIsavailable() {
    return isavailable;
  }

  public void setIsavailable(Integer isavailable) {
    this.isavailable = isavailable;
  }

  public String getUserArrangement() {
    return userArrangement;
  }

  public void setUserArrangement(String userArrangement) {
    this.userArrangement = userArrangement;
  }

  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }


  public String getPassWord() {
    return passWord;
  }

  public void setPassWord(String passWord) {
    this.passWord = passWord;
  }


  public Integer getRoleId() {
    return roleId;
  }

  public void setRoleId(Integer roleId) {
    this.roleId = roleId;
  }

  public String getEnglishName() {
    return englishName;
  }

  public void setEnglishName(String englishName) {
    this.englishName = englishName;
  }


  public String getChineseName() {
    return chineseName;
  }

  public void setChineseName(String chineseName) {
    this.chineseName = chineseName;
  }


  public java.sql.Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.sql.Timestamp createTime) {
    this.createTime = createTime;
  }


  public java.sql.Timestamp getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(java.sql.Timestamp updateTime) {
    this.updateTime = updateTime;
  }

}
