package com.crmdemo.entity;


public class Menu {

  private Integer menuId;
  private String menuName;
  private String subMenuRemark;
  private String menuUrl;
  private Integer parentId;
  private Integer isMenu;
  private Integer subParentId;
  private String roleValue;


  public Integer getMenuId() {
    return menuId;
  }

  public void setMenuId(Integer menuId) {
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


  public Integer getParentId() {
    return parentId;
  }

  public void setParentId(Integer parentId) {
    this.parentId = parentId;
  }


  public Integer getIsMenu() {
    return isMenu;
  }

  public void setIsMenu(Integer isMenu) {
    this.isMenu = isMenu;
  }


  public Integer getSubParentId() {
    return subParentId;
  }

  public void setSubParentId(Integer subParentId) {
    this.subParentId = subParentId;
  }


  public String getRoleValue() {
    return roleValue;
  }

  public void setRoleValue(String roleValue) {
    this.roleValue = roleValue;
  }

}
