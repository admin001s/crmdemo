package com.crmdemo.service.impl;

import com.crmdemo.dao.CustomerserviceDao;
import com.crmdemo.entity.Customerservice;
import com.crmdemo.service.CustomerserviceService;
import com.crmdemo.vop.Openservicevop;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class CustomerserviceServiceImpl implements CustomerserviceService {
    private Logger logger=Logger.getLogger(CrmcustomersinfoServiceImpl.class);

    @Resource
    private CustomerserviceDao customerserviceDao;

    @Override
    public List<Customerservice> selectcustomerservice(String name) {
        List<Customerservice> customerservice=null;
        try {
            customerservice=customerserviceDao.customerservicelist(name);
            logger.debug("do selectcustomerservice()------------------------------");
        }catch (Exception e){
            logger.debug("do selectcustomerservice()------------------------------"+e.getMessage());
        }
        return customerservice;
    }

    @Override
    public Integer Insertcustomerservice(String name) {
        int i=0;
        try {
            i=customerserviceDao.customerserviceAdd(name);
            logger.debug("do Insertcustomerservice()------------------------------");
        }catch (Exception e){
            logger.debug("do Insertcustomerservice()------------------------------"+e.getMessage());
        }
        return i;
    }

    @Override
    public Integer delcustomerservice(String id) {
        int i=0;
        try {
            i=customerserviceDao.delcustomerservice(id);
            logger.debug("do delcustomerservice()------------------------------");
        }catch (Exception e){
            logger.debug("do delcustomerservice()------------------------------"+e.getMessage());
        }
        return i;
    }
}
