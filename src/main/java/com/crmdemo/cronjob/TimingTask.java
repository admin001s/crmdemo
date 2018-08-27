package com.crmdemo.cronjob;

import com.crmdemo.dao.CrmcustomersinfoDao;
import com.crmdemo.entity.Crmcustomersinfo;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.sql.Date;
import java.util.List;

@Component
public class TimingTask {
    @Resource
    CrmcustomersinfoDao crmcustomersinfoDao;
    @Scheduled(cron = "0 55 23 ? * *")
    public void test(){
        Crmcustomersinfo crmcustomersinfo=new Crmcustomersinfo();
        crmcustomersinfo.setBeOverdue(new Date(System.currentTimeMillis()));
        crmcustomersinfo.setCustomerStatus(2);
        try {
            List<Crmcustomersinfo> crmcustomersinfos=crmcustomersinfoDao.selectCrmcustomersinfos(crmcustomersinfo);
            for(Crmcustomersinfo crmcustomersinfo1:crmcustomersinfos){
                crmcustomersinfo=new Crmcustomersinfo();
                crmcustomersinfo.setId(crmcustomersinfo1.getId());
                crmcustomersinfo.setCustomerStatus(1);
                if(crmcustomersinfoDao.updateCrmcustomersinfo(crmcustomersinfo)>0){

                }else {
                    throw  new Exception();
                }
            }
            Crmcustomersinfo crmcustomersinfo1=new Crmcustomersinfo();
            crmcustomersinfo1.setReadingState(1);
            if(crmcustomersinfoDao.updateCrmcustomersinfo(crmcustomersinfo1)>0){

            }else {
                throw  new Exception();
            }
        }catch (Exception e){

        }
    }
}
