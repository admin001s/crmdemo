package com.crmdemo.service.impl;

import com.crmdemo.dao.CrminfoDao;
import com.crmdemo.entity.Crminfo;
import com.crmdemo.service.CrminfoService;
import com.crmdemo.util.CommonUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class CrminfoServiceImpl implements CrminfoService {


    @Resource
    CrminfoDao crminfoDao;
    @Override
    public List<Crminfo> selectCrminfoList(Crminfo crminfo) {
        List<Crminfo> crminfoList=null;
        try {
            crminfoList=crminfoDao.selectCrminfoList(crminfo);
        }catch (Exception e){

        }
        return crminfoList;
    }

    @Override
    public Crminfo selectLogin(Crminfo crminfo) {
        Crminfo crminfo1=null;
        List<Crminfo> crminfoList=null;
        try {
            crminfoList=crminfoDao.selectcrmByName(crminfo);
            if(null !=crminfoList){
                crminfo1=crminfoList.get(0);
                if(CommonUtils.getMD5(crminfo.getPassWord()).equals(crminfo1.getPassWord())){
                    return crminfo1;
                }else {
                    crminfo1=new Crminfo();
                    crminfo1.setUserId(-1);
                }
            }
        }catch (Exception e){

        }
        return crminfo1;
    }
}
