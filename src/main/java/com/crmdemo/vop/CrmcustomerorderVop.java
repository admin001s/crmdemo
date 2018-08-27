package com.crmdemo.vop;

import com.crmdemo.entity.Crmcustomerorder;
import com.crmdemo.entity.Crmcustomersinfo;
import com.crmdemo.entity.Crminfo;

public class CrmcustomerorderVop extends Crmcustomerorder {
    private Crminfo crminfo;
    private Crmcustomersinfo crmcustomersinfo;
    private String indate;
    private String outdate;

    public String getOutdate() {
        return outdate;
    }

    public void setOutdate(String outdate) {
        this.outdate = outdate;
    }

    public String getIndate() {

        return indate;
    }

    public void setIndate(String indate) {
        this.indate = indate;
    }

    public Crmcustomersinfo getCrmcustomersinfo() {
        return crmcustomersinfo;
    }

    public void setCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo) {
        this.crmcustomersinfo = crmcustomersinfo;
    }

    public Crminfo getCrminfo() {
        return crminfo;
    }

    public void setCrminfo(Crminfo crminfo) {
        this.crminfo = crminfo;
    }
}
