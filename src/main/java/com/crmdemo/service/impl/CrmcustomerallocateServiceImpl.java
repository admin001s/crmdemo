package com.crmdemo.service.impl;

import com.crmdemo.dao.CrmcustomerallocateDao;
import com.crmdemo.entity.Crmcustomerallocate;
import com.crmdemo.service.CrmcustomerallocateService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CrmcustomerallocateServiceImpl implements CrmcustomerallocateService {
    @Resource
    CrmcustomerallocateDao crmcustomerallocateDao;
    @Override
    public boolean insertCrmcustomerallocate(Crmcustomerallocate crmcustomerallocate) {
        try {
            if(crmcustomerallocateDao.insertCrmcustomerallocate(crmcustomerallocate)>0){
                return true;
            }
        }catch (Exception e){

        }
        return false;
    }
}
