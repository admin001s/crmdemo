package com.crmdemo.service;

import com.crmdemo.entity.Crmcustomersinfo;




import java.util.List;


public interface CrmcustomersinfoService {

    //查询客户
    List<Crmcustomersinfo> selectcrmcustomersinfo();
    boolean addCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo);
    List<Crmcustomersinfo> selectCrmcustomersinfoList(Crmcustomersinfo crmcustomersinfo);
}
