package com.crmdemo.service.impl;

import com.crmdemo.dao.CrmcustomersinfoDao;
import com.crmdemo.entity.Crmcustomersinfo;
import com.crmdemo.service.CrmcustomersinfoService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class CrmcustomersinfoServiceImpl implements CrmcustomersinfoService {
    private Logger logger=Logger.getLogger(CrmcustomersinfoServiceImpl.class);

    @Resource
    private CrmcustomersinfoDao crmcustomersinfoDao;

    @Override
    public List<Crmcustomersinfo> selectcrmcustomersinfo() {
        List<Crmcustomersinfo> crmcustomersinfoList=null;
        try {
            crmcustomersinfoList=crmcustomersinfoDao.selectcrmcustomersinfo();
            logger.debug("do selectcrmcustomersinfo()------------------------------");
        }catch (Exception e){
            logger.debug("do selectcrmcustomersinfo()------------------------------"+e.getMessage());
        }
        return crmcustomersinfoList;
    }
}
