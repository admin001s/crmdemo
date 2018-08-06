package com.crmdemo.service.impl;

import com.crmdemo.dao.CrmtaskscheduleDao;
import com.crmdemo.entity.Crmtaskschedule;
import com.crmdemo.service.CrmtaskscheduleService;
import com.crmdemo.vop.Crmtaskschedulevop;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class CrmtaskscheduleServiceImpl implements CrmtaskscheduleService {
    @Resource
    private CrmtaskscheduleDao crmtaskscheduleDao;
    private Logger logger = Logger.getLogger(CrmproductserviceServiceImpl.class);

    @Override
    public List<Crmtaskschedulevop> selectCrmtaskschedulevop() {
        List<Crmtaskschedulevop> crmtaskschedulevops = null;
        try {
            crmtaskschedulevops = crmtaskscheduleDao.selectCrmtaskschedulevop();
            logger.debug("do selectCrmtaskschedulevop()------------------------------");
        } catch (Exception e) {
            logger.debug("do selectCrmtaskschedulevop()------------------------------" + e.getMessage());
        }
        return crmtaskschedulevops;
    }

    @Override
    public Integer addCrmtaskschedule(Crmtaskschedule crmtaskschedule) {
        Integer i = 0;
        try {
            i = crmtaskscheduleDao.addCrmtaskschedule(crmtaskschedule);
            logger.debug("do addCrmtaskschedule()------------------------------");
        } catch (Exception e) {
            logger.debug("do addCrmtaskschedule()------------------------------" + e.getMessage());
        }
        return i;
    }

    @Override
    public Integer updateCrmtaskschedule(Crmtaskschedule crmtaskschedule) {
        Integer i = 0;
        try {
            i = crmtaskscheduleDao.updateCrmtaskschedule(crmtaskschedule);
            logger.debug("do updateCrmtaskschedule()------------------------------");
        } catch (Exception e) {
            logger.debug("do updateCrmtaskschedule()------------------------------" + e.getMessage());
        }
        return i;
    }
}
