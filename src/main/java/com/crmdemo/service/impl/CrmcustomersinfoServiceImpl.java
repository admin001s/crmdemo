package com.crmdemo.service.impl;

import com.crmdemo.dao.CrmcustomersinfoDao;
import com.crmdemo.entity.Crmcustomersinfo;
import com.crmdemo.service.CrmcustomersinfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CrmcustomersinfoServiceImpl implements CrmcustomersinfoService {
    @Resource
    CrmcustomersinfoDao crmcustomersinfoDao;
    @Override
    public boolean addCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo) {
        try {
            if(crmcustomersinfoDao.insertCrmcustomersinfo(crmcustomersinfo)>0){
                return  true;
            }
        }catch (Exception e){

        }
        return false;
    }
}
