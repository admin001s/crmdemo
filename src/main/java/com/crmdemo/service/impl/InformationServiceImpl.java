package com.crmdemo.service.impl;

import com.crmdemo.dao.CrmcustomersinfoDao;
import com.crmdemo.dao.InformationDao;
import com.crmdemo.entity.Crmcustomersinfo;
import com.crmdemo.entity.Crminfo;
import com.crmdemo.entity.Information;
import com.crmdemo.service.InformationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.List;
@Service
public class InformationServiceImpl implements InformationService {
    @Resource
    InformationDao informationDao;
    @Resource
    CrmcustomersinfoDao crmcustomersinfoDao;
    @Override
    public boolean insertInformationEveryDay(List<Crmcustomersinfo> crmcustomersinfos, Crminfo crminfo) {
        try {
            for(Crmcustomersinfo crmcustomersinfo:crmcustomersinfos){
                if(crmcustomersinfo.getReadingState()==1){
                    Information information=new Information();
                    information.setCustomerId(crmcustomersinfo.getId());
                    information.setUserId(crminfo.getUserId());
                    information.setMationStatus(1);
                    information.setCreateTime(new Timestamp(System.currentTimeMillis()));
                    information.setTitle("客户："+crmcustomersinfo.getCustomersName()+"将在今日过期,请尽快与此客户签单！");
                    if(informationDao.insertInformation(information)>0){

                    }else {
                        throw new Exception();
                    }
                    Crmcustomersinfo crmcustomersinfo1=new Crmcustomersinfo();
                    crmcustomersinfo1.setId(crmcustomersinfo.getId());
                    crmcustomersinfo1.setReadingState(2);
                    if(crmcustomersinfoDao.updateCrmcustomersinfo(crmcustomersinfo1)>0){

                    }else {
                        throw new Exception();
                    }
                }
            }
            return true;
        }catch (Exception e){

        }
        return false;
    }

    @Override
    public List<Information> selectInfomations(Information information) {
        List<Information> informationList=null;
        try {
            informationList=informationDao.selectInfomations(information);
        }catch (Exception e){

        }
        return informationList;
    }

    @Override
    public boolean updateInformation(Information information) {
        try {
            if(informationDao.updateInformation(information)>0){
                return true;
            }
        }catch (Exception e){

        }
        return false;
    }

    @Override
    public boolean updateInformationByUser(Information information) {
        try {
            if(informationDao.updateInformationByUser(information)>0){
                return true;
            }
        }catch (Exception e){

        }
        return false;
    }
}
