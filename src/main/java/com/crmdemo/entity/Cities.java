package com.crmdemo.entity;


public class Cities {

  private Integer id;
  private String cityid;
  private String city;
  private String provinceid;


  public long getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public String getCityid() {
    return cityid;
  }

  public void setCityid(String cityid) {
    this.cityid = cityid;
  }


  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }


  public String getProvinceid() {
    return provinceid;
  }

  public void setProvinceid(String provinceid) {
    this.provinceid = provinceid;
  }

}
