package com.crmdemo.vop;

import com.crmdemo.entity.Agencystaff;
import com.crmdemo.entity.Crmcustomersinfo;

public class AgencystaffVop extends Agencystaff {
    private  String agentName;

    public String getAgentName() {
        return agentName;
    }

    public void setAgentName(String agentName) {
        this.agentName = agentName;
    }
}
