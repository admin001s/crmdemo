package com.crmdemo.vop;

import com.crmdemo.entity.Crmagentsinfo;
import com.crmdemo.entity.Crminfo;

public class CrmagentsinfoVop extends Crmagentsinfo {
    private Crminfo crminfo;

    public Crminfo getCrminfo() {
        return crminfo;
    }

    public void setCrminfo(Crminfo crminfo) {
        this.crminfo = crminfo;
    }
}
