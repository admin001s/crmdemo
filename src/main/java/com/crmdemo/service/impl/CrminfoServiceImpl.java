package com.crmdemo.service.impl;

import com.crmdemo.dao.CrminfoDao;
import com.crmdemo.entity.Crminfo;
import com.crmdemo.service.CrminfoService;
import com.crmdemo.util.CommonUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CrminfoServiceImpl implements CrminfoService {

    @Resource
    CrminfoDao crminfoDao;
    @Override
    public Crminfo selectLogin(Crminfo crminfo) {
        Crminfo crminfo1=null;
        List<Crminfo> crminfoList=null;
        try {
            if(null !=crminfoList){
                crminfo1=crminfoList.get(0);
                if(CommonUtils.MD5Encrypt(crminfo.getPassWord()).equals(crminfo1.getPassWord())){
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
