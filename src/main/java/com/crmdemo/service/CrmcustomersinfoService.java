package com.crmdemo.service;

import com.crmdemo.entity.Crmcustomerallocate;
import com.crmdemo.entity.Crmcustomersinfo;
import com.crmdemo.vop.CrmcustomersinfoVop;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


public interface CrmcustomersinfoService {

    //查询客户
    List<Crmcustomersinfo> selectcrmcustomersinfo(String open);
    boolean addCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo);
    List<CrmcustomersinfoVop> selectCrmcustomersinfoList(Crmcustomersinfo crmcustomersinfo);

    boolean isrepeat(Crmcustomersinfo crmcustomersinfo);
    //为客户分配根据人员
    boolean updateCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo , Crmcustomerallocate crmcustomerallocate);

    Crmcustomersinfo selectCrmcustomersinfoById(Integer id);

    boolean deleteCrmcustomerssinfo(Integer id);

    boolean updateCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo);

    boolean updateCustomersTransfer(String[] id, String beiuserId, HttpServletRequest request, HttpServletResponse response);
    boolean rotationCustomers(String[] id,String beiuserId, HttpServletRequest request, HttpServletResponse response);
}
