package com.crmdemo.service.impl;

import com.crmdemo.dao.OpenserviceDao;
import com.crmdemo.entity.Openservice;
import com.crmdemo.service.OpenserviceService;
import com.crmdemo.vop.Openservicevop;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class OpenserviceServiceImpl implements OpenserviceService {
    private Logger logger=Logger.getLogger(CrmcustomersinfoServiceImpl.class);
    @Resource
    private OpenserviceDao openserviceDao;
    @Override
    public List<Openservice> selectOpenservice(String crmcustomersinfoid) {
        List<Openservice> openservice=null;
        try {
            openservice=openserviceDao.OPENSERVICE(crmcustomersinfoid);
            logger.debug("do selectOpenservice()------------------------------");
        }catch (Exception e){
            logger.debug("do selectOpenservice()------------------------------"+e.getMessage());
        }
        return openservice;
    }

    @Override
    public Integer insertOpenservice(Openservice openservice) {
        Integer i =0;
        try {
            i=openserviceDao.insertOpenservice(openservice);
            logger.debug("do selectOpenservice()------------------------------");
        }catch (Exception e){
            logger.debug("do selectOpenservice()------------------------------"+e.getMessage());
        }
        return i;
    }

    @Override
    public Integer deleteOpenservice(String crmcustomersinfoid) {
        Integer i =0;
        try {
            i=openserviceDao.deleteOpenservice(crmcustomersinfoid);
            logger.debug("do deleteOpenservice()------------------------------");
        }catch (Exception e){
            logger.debug("do deleteOpenservice()------------------------------"+e.getMessage());
        }
        return i;
    }

    @Override
    public List<Openservicevop> selectALlOpen(String fen) {
        List<Openservicevop> openservice=null;
        try {
            openservice=openserviceDao.selectALlOpen(fen);
            logger.debug("do selectALlOpen()------------------------------");
        }catch (Exception e){
            logger.debug("do selectALlOpen()------------------------------"+e.getMessage());
        }
        return openservice;
    }

    @Override
    public Integer updateOpenservice(String customerservice, String id) {
        Integer i =0;
        try {
            i=openserviceDao.updateOpenservice(customerservice,id);
            logger.debug("do updateOpenservice()------------------------------");
        }catch (Exception e){
            logger.debug("do updateOpenservice()------------------------------"+e.getMessage());
        }
        return i;
    }
}
