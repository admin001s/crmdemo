package com.sample;


public class Crmserviceeffect {

  private long serviceEffectId;
  private long exposureRate;
  private long searchDiscRate;
  private long interactionRate;
  private String impressionDrawing;
  private java.sql.Timestamp updateTime;
  private java.sql.Timestamp createTime;


  public long getServiceEffectId() {
    return serviceEffectId;
  }

  public void setServiceEffectId(long serviceEffectId) {
    this.serviceEffectId = serviceEffectId;
  }


  public long getExposureRate() {
    return exposureRate;
  }

  public void setExposureRate(long exposureRate) {
    this.exposureRate = exposureRate;
  }


  public long getSearchDiscRate() {
    return searchDiscRate;
  }

  public void setSearchDiscRate(long searchDiscRate) {
    this.searchDiscRate = searchDiscRate;
  }


  public long getInteractionRate() {
    return interactionRate;
  }

  public void setInteractionRate(long interactionRate) {
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
