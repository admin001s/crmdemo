package com.crmdemo.vop;
import com.crmdemo.entity.Crmcustomerdetails;
import com.crmdemo.entity.Crmcustomersinfo;
import com.crmdemo.entity.Crminfo;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

public class CrmcustomerdetailsVop extends Crmcustomerdetails {
    private Crminfo crminfo;
    private Crmcustomersinfo crmcustomersinfo;
    private java.sql.Date createDate;
    private Time time;
    private String[] path;

    public Crmcustomersinfo getCrmcustomersinfo() {
        return crmcustomersinfo;
    }

    public void setCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo) {
        this.crmcustomersinfo = crmcustomersinfo;
    }

    public String[] getPath() {
        return path;
    }

    public void setPath(String[] path) {
        this.path = path;
    }

    public Timestamp getZsT() {
        return zsT;
    }

    public void setZsT(Timestamp zsT) {
        this.zsT = zsT;
    }

    private java.sql.Timestamp zsT;
    private Responsible responsible;

    public Responsible getResponsible() {
        return responsible;
    }

    public void setResponsible(Responsible responsible) {
        this.responsible = responsible;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public java.sql.Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(java.sql.Date createDate) {
        this.createDate = createDate;
    }

    public Crminfo getCrminfo() {
        return crminfo;
    }

    public void setCrminfo(Crminfo crminfo) {
        this.crminfo = crminfo;
    }
}
