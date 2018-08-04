package com.crmdemo.vop;

import com.crmdemo.entity.Openservice;

public class Openservicevop extends Openservice {

    private String openserviceTypeall;
    private String customersName;
    private String  cuname;


    public String getCuname() {
        return cuname;
    }

    public void setCuname(String cuname) {
        this.cuname = cuname;
    }

    public String getCustomersName() {
        return customersName;
    }

    public void setCustomersName(String customersName) {
        this.customersName = customersName;
    }

    public String getOpenserviceTypeall() {
        return openserviceTypeall;
    }

    public void setOpenserviceTypeall(String openserviceTypeall) {
        this.openserviceTypeall = openserviceTypeall;
    }
}
