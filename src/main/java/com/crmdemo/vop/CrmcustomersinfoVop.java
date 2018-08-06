package com.crmdemo.vop;
import com.crmdemo.entity.Crmcustomerdetails;
import com.crmdemo.entity.Crmcustomersinfo;
import com.crmdemo.entity.Crminfo;

import java.util.List;

public class CrmcustomersinfoVop extends Crmcustomersinfo {
    Crminfo crminfo;
    List<Crmcustomerdetails> crmcustomerdetailsList;
    public Crminfo getCrminfo() {
        return crminfo;
    }

    public void setCrminfo(Crminfo crminfo) {
        this.crminfo = crminfo;
    }

    public List<Crmcustomerdetails> getCrmcustomerdetailsList() {
        return crmcustomerdetailsList;
    }

    public void setCrmcustomerdetailsList(List<Crmcustomerdetails> crmcustomerdetailsList) {
        this.crmcustomerdetailsList = crmcustomerdetailsList;
    }
}
