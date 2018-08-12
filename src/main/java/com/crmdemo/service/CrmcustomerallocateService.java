package com.crmdemo.service;

import com.crmdemo.entity.Crmcustomerallocate;
import com.crmdemo.vop.CrmcustomerdetailsVop;

import java.util.List;

public interface CrmcustomerallocateService {
    boolean insertCrmcustomerallocate(Crmcustomerallocate crmcustomerallocate);
    List<Crmcustomerallocate> selectCrmcustomerallocateList(Crmcustomerallocate crmcustomerallocate);
    List<CrmcustomerdetailsVop> selectFollowup(Integer id);
}
