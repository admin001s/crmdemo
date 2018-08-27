package com.crmdemo.service;

import com.crmdemo.entity.Crmcustomerorder;
import com.crmdemo.entity.Crminfo;
import com.crmdemo.vop.CrmcustomerorderVop;
import org.apache.logging.log4j.util.Strings;

import java.util.List;

public interface CrmcustomerorderService {
    boolean insertCrmcustomerorder(Crmcustomerorder crmcustomerorder);

    boolean updateCrmcustomerorder(Crmcustomerorder crmcustomerorder);

    List<CrmcustomerorderVop> selectCrmcustomerorderVopList(CrmcustomerorderVop crmcustomerorderVop);

    boolean updateCrmcustomerorderStatus(Integer id, Integer status,Integer sp, Crminfo crminfo);

    boolean updateCrmcustomerordersStatus(String[] ids, Integer status,Integer sp, Crminfo crminfo);

    boolean deleteCrmcustomerorder(Integer id);

    CrmcustomerorderVop selectCrmcustomerorderById(Integer id);

    List<Crmcustomerorder> selectCrmcustomerorderCount(Crmcustomerorder crmcustomerorder);

}
