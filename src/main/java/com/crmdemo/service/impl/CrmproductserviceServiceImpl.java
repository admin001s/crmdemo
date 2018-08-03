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
    public List<Crmproductservice> selectCrmproductservice() {
        List<Crmproductservice> Crmproductservice=null;
        try {
            Crmproductservice=crmproductserviceDao.CRMPRODUCTSERVICE_LIST();
            logger.debug("do crmproductserviceDao()------------------------------");
        }catch (Exception e){
            logger.debug("do crmproductserviceDao()------------------------------"+e.getMessage());
        }
        return Crmproductservice;
    }
}
