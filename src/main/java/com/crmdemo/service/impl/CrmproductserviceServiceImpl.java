package com.crmdemo.service.impl;

import com.crmdemo.dao.CrmproductserviceDao;
import com.crmdemo.entity.Crmproductservice;
import com.crmdemo.service.CrmproductserviceService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class CrmproductserviceServiceImpl implements CrmproductserviceService {
    private Logger logger=Logger.getLogger(CrmcustomersinfoServiceImpl.class);

    @Resource
    private CrmproductserviceDao crmproductserviceDao;

    @Override
    public List<Crmproductservice> selectCrmproductservice(String id) {
        List<Crmproductservice> Crmproductservice=null;
        try {
            Crmproductservice=crmproductserviceDao.CRMPRODUCTSERVICE_LIST(id);
            logger.debug("do crmproductserviceDao()------------------------------");
        }catch (Exception e){
            logger.debug("do crmproductserviceDao()------------------------------"+e.getMessage());
        }
        return Crmproductservice;
    }

    @Override
    public Integer updateCrmproductservice(Crmproductservice crmproductservice) {
       Integer i=0;
        try {
            i=crmproductserviceDao.updateCrmproductservice(crmproductservice);
            logger.debug("do updateCrmproductservice()------------------------------");
        }catch (Exception e){
            logger.debug("do updateCrmproductservice()------------------------------"+e.getMessage());
        }
        return i;
    }

    @Override
    public Integer delCrmproductservice(String id) {
        Integer i=0;
        try {
            i=crmproductserviceDao.delCrmproductservice(id);
            logger.debug("do delCrmproductservice()------------------------------");
        }catch (Exception e){
            logger.debug("do delCrmproductservice()------------------------------"+e.getMessage());
        }
        return i;
    }

    @Override
    public Integer addCrmproductservice(Crmproductservice crmproductservice) {
        Integer i=0;
        try {
            i=crmproductserviceDao.addCrmproductservice(crmproductservice);
            logger.debug("do addCrmproductservice()------------------------------");
        }catch (Exception e){
            logger.debug("do addCrmproductservice()------------------------------"+e.getMessage());
        }
        return i;
    }
}
