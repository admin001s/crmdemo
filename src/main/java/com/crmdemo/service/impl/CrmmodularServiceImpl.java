package com.crmdemo.service.impl;

import com.crmdemo.dao.CrmmodularDao;
import com.crmdemo.entity.Crmmodular;
import com.crmdemo.entity.Crmproductservice;
import com.crmdemo.service.CrmmodularService;
import com.crmdemo.vop.Crmmodularvop;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class CrmmodularServiceImpl  implements CrmmodularService {
    private Logger logger=Logger.getLogger(CrmmodularServiceImpl.class);
    @Resource
    private CrmmodularDao crmmodularDao;

    @Override
    public List<Crmmodularvop> selectcrmmodular(String id) {
        List<Crmmodularvop> crmmodularDaos=null;
        try {
            crmmodularDaos=crmmodularDao.selectcrmmodular(id);
            logger.debug("do selectcrmmodular()------------------------------");
        }catch (Exception e){
            logger.debug("do selectcrmmodular()------------------------------"+e.getMessage());
        }
        return crmmodularDaos;
    }

    @Override
    public Integer updatecrmmodular(Crmmodular crmmodular) {
       int i=0;
        try {
            i=crmmodularDao.updatecrmmodular(crmmodular);
            logger.debug("do updatecrmmodular()------------------------------");
        }catch (Exception e){
            logger.debug("do updatecrmmodular()------------------------------"+e.getMessage());
        }
        return i;
    }

    @Override
    public Integer delcrmmodular(String id) {
        int i=0;
        try {
            i=crmmodularDao.delcrmmodular(id);
            logger.debug("do delcrmmodular()------------------------------");
        }catch (Exception e){
            logger.debug("do delcrmmodular()------------------------------"+e.getMessage());
        }
        return i;
    }

    @Override
    public Integer addcrmmodular(Crmmodular crmmodular) {
        int i=0;
        try {
            i=crmmodularDao.addcrmmodular(crmmodular);
            logger.debug("do addcrmmodular()------------------------------");
        }catch (Exception e){
            logger.debug("do addcrmmodular()------------------------------"+e.getMessage());
        }
        return i;
    }
}
