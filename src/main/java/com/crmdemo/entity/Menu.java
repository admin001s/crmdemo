package com.sample;


public class Menu {

  private long menuId;
  private String menuName;
  private String subMenuRemark;
  private String menuUrl;
  private long parentId;
  private long isMenu;
  private long subParentId;
  private String roleValue;


  public long getMenuId() {
    return menuId;
  }

  public void setMenuId(long menuId) {
    this.menuId = menuId;
  }


  public String getMenuName() {
    return menuName;
  }

  public void setMenuName(String menuName) {
    this.menuName = menuName;
  }


  public String getSubMenuRemark() {
    return subMenuRemark;
  }

  public void setSubMenuRemark(String subMenuRemark) {
    this.subMenuRemark = subMenuRemark;
  }


  public String getMenuUrl() {
    return menuUrl;
  }

  public void setMenuUrl(String menuUrl) {
    this.menuUrl = menuUrl;
  }


  public long getParentId() {
    return parentId;
  }

  public void setParentId(long parentId) {
    this.parentId = parentId;
  }


  public long getIsMenu() {
    return isMenu;
  }

  public void setIsMenu(long isMenu) {
    this.isMenu = isMenu;
  }


  public long getSubParentId() {
    return subParentId;
  }

  public void setSubParentId(long subParentId) {
    this.subParentId = subParentId;
  }


  public String getRoleValue() {
    return roleValue;
  }

  public void setRoleValue(String roleValue) {
    this.roleValue = roleValue;
  }

}
