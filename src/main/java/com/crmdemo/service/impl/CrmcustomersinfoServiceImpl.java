package com.crmdemo.service.impl;

import com.crmdemo.dao.CrmcustomersinfoDao;
import com.crmdemo.entity.Crmcustomersinfo;
import com.crmdemo.service.CrmcustomersinfoService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class CrmcustomersinfoServiceImpl implements CrmcustomersinfoService {
    private Logger logger=Logger.getLogger(CrmcustomersinfoServiceImpl.class);
    @Resource
    CrmcustomersinfoDao crmcustomersinfoDao;

    @Override
    public boolean isrepeat(Crmcustomersinfo crmcustomersinfo) {
        try {
            if(crmcustomersinfoDao.selectCrmcustomersinfoCount(crmcustomersinfo)>0){
                return false;
            }
        }catch (Exception e){

        }
        return true;
    }

    @Override
    public List<Crmcustomersinfo> selectCrmcustomersinfoList(Crmcustomersinfo crmcustomersinfo) {
        List<Crmcustomersinfo> crmcustomersinfoList=null;
        try {
            crmcustomersinfoList=crmcustomersinfoDao.selectCrmcustomersinfoList(crmcustomersinfo);
            logger.debug("do selectcrmcustomersinfo()------------------------------");
        }catch (Exception e){
            logger.debug("do selectcrmcustomersinfo()------------------------------"+e.getMessage());
        }
        return crmcustomersinfoList;
    }

    @Override
    public boolean addCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo) {
        try {
            if (crmcustomersinfoDao.insertCrmcustomersinfo(crmcustomersinfo) > 0) {
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }


    @Override
    public List<Crmcustomersinfo> selectcrmcustomersinfo(String open) {
        List<Crmcustomersinfo> crmcustomersinfoList=null;
        try {
            crmcustomersinfoList=crmcustomersinfoDao.selectcrmcustomersinfo(open);
            logger.debug("do selectcrmcustomersinfo()------------------------------");
        }catch (Exception e){
            logger.debug("do selectcrmcustomersinfo()------------------------------"+e.getMessage());
        }
        return crmcustomersinfoList;
    }
}
