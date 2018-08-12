package com.crmdemo.vop;

import com.crmdemo.entity.Crmcustomerallocate;
import com.crmdemo.entity.Crminfo;

public class CrmcustomerallocateVop extends Crmcustomerallocate {
    private  Crminfo crminfo;

    public Crminfo getCrminfo() {
        return crminfo;
    }

    public void setCrminfo(Crminfo crminfo) {
        this.crminfo = crminfo;
    }
}
