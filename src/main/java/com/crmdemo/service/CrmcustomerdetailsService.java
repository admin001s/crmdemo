package com.crmdemo.service;

import com.crmdemo.entity.Crmcustomerdetails;
import com.crmdemo.vop.CrmcustomerdetailsVop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


public interface CrmcustomerdetailsService {
    boolean insertCrmcustomerdetails(Crmcustomerdetails crmcustomerdetails);

    List<CrmcustomerdetailsVop> selectCrmcustomerdetailsVopList(Integer id, HttpServletRequest request, HttpServletResponse response);

    List<CrmcustomerdetailsVop> selectcrmcustomerdetailsVopListByUser(Integer userId);
    List<Crmcustomerdetails> selectcrmcustomerByUserCount(CrmcustomerdetailsVop crmcustomerdetailsVop);
}
