package com.crmdemo.vop;

import com.crmdemo.entity.Auditrecord;
import com.crmdemo.entity.Crmcustomerorder;
import com.crmdemo.entity.Crminfo;

public class AuditrecordVop extends Auditrecord {
    private Crminfo crminfo;
    private Crmcustomerorder crmcustomerorder;
    private String indate;
    private String outdate;

    public String getIndate() {
        return indate;
    }

    public void setIndate(String indate) {
        this.indate = indate;
    }

    public String getOutdate() {
        return outdate;
    }

    public void setOutdate(String outdate) {
        this.outdate = outdate;
    }

    public Crminfo getCrminfo() {
        return crminfo;
    }

    public void setCrminfo(Crminfo crminfo) {
        this.crminfo = crminfo;
    }

    public Crmcustomerorder getCrmcustomerorder() {
        return crmcustomerorder;
    }

    public void setCrmcustomerorder(Crmcustomerorder crmcustomerorder) {
        this.crmcustomerorder = crmcustomerorder;
    }
}
