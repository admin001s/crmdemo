package com.crmdemo.entity;


public class Crmserviceeffect {

  private Integer serviceEffectId;
  private Integer exposureRate;
  private Integer searchDiscRate;
  private Integer interactionRate;
  private String impressionDrawing;
  private java.sql.Timestamp updateTime;
  private java.sql.Timestamp createTime;


  public Integer getServiceEffectId() {
    return serviceEffectId;
  }

  public void setServiceEffectId(Integer serviceEffectId) {
    this.serviceEffectId = serviceEffectId;
  }


  public Integer getExposureRate() {
    return exposureRate;
  }

  public void setExposureRate(Integer exposureRate) {
    this.exposureRate = exposureRate;
  }


  public Integer getSearchDiscRate() {
    return searchDiscRate;
  }

  public void setSearchDiscRate(Integer searchDiscRate) {
    this.searchDiscRate = searchDiscRate;
  }


  public Integer getInteractionRate() {
    return interactionRate;
  }

  public void setInteractionRate(Integer interactionRate) {
    this.interactionRate = interactionRate;
  }


  public String getImpressionDrawing() {
    return impressionDrawing;
  }

  public void setImpressionDrawing(String impressionDrawing) {
    this.impressionDrawing = impressionDrawing;
  }


  public java.sql.Timestamp getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(java.sql.Timestamp updateTime) {
    this.updateTime = updateTime;
  }


  public java.sql.Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.sql.Timestamp createTime) {
    this.createTime = createTime;
  }

}
