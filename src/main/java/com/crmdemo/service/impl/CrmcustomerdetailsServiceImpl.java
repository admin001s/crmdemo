package com.crmdemo.service.impl;

import com.crmdemo.dao.CrmcustomerdetailsDao;
import com.crmdemo.entity.Crmcustomerdetails;
import com.crmdemo.service.CrmcustomerdetailsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CrmcustomerdetailsServiceImpl implements CrmcustomerdetailsService {
    @Resource
    CrmcustomerdetailsDao crmcustomerdetailsDao;
    @Override
    public boolean insertCrmcustomerdetails(Crmcustomerdetails crmcustomerdetails) {
        try {
            if(crmcustomerdetailsDao.insertCrmcustomerdetails(crmcustomerdetails)>0){
                return true;
            }
        }catch (Exception e){

        }
        return false;
    }
}
